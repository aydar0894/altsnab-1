namespace :parsing do
  namespace :norway do

    class Parser

      BUFFER_SIZE = 2000

      def logger
        Rails.logger
      end

      def companies_csv_file
        #Norway::CsvDownloadingWorker.new.companies_csv_file
        'companies.csv'
      end

      def activities_csv_file
        #Norway::CsvDownloadingWorker.new.activities_csv_file
        'activities.csv'
      end

      def clear_database
        # FOR TESTING NO CLEARING
        # !!!!!!!!!!!!!!!!!!!!!!!
        #    # First, delete links
        #    Registers::Norway::Dnn::CompanyActivity.delete_all
        #
        #    # Only then delete records
        #    Registers::Norway::Dnn::Company.delete_all
        #    Registers::Norway::Dnn::Activity.delete_all
      end

      # Convert Norwegian string to boolean.
      # Blank string gives nil.
      #
      # In Norwegian Ja means yes and Nei means No
      def to_b(s)
        return nil if s.blank?
        dc = s.downcase
        return true if dc == 'j' || dc == 'ja'
        return false if dc == 'n' || dc == 'nei'
        raise "String '#{s}' doesn't mean YES nor NO"
      end


      # Create a Date object from CSV string
      def to_date(s)
        return nil if s.blank?
        Date.strptime(s, '%d.%m.%Y')
      end

      # HACK: The csv files contains backslash escapes.
      # We need to unescape them. \" should be "", \\ should be \
      # see https://stackoverflow.com/a/12772298/3818513
      #
      # HACK: In the end of csv the last \n can be replaced with \r,
      # we remove it
      def csv_foreach(filename, &block)
        file = Class.new(File) do
          def gets(*args)
            super(*args)&.remove("\r")&.gsub(/\\(.)/) {$1 == '"' ? '""' : $1}
          end
        end.new(filename)
        csv = CSV.new(file, headers: true, col_sep: ';', skip_blanks: true)
        csv.each(&block)
      end

      def company_from_csv_line(line)
        comp = Registers::Norway::Dnn::Company.new
        comp[:orgnr] = line['orgnr']
        comp[:navn] = line['navn']
        comp[:organisasjonsform] = line['organisasjonsform']
        comp[:forretningsadr] = line['forretningsadr']
        comp[:forradrpostnr] = line['forradrpostnr']
        comp[:forradrpoststed] = line['forradrpoststed']
        comp[:forradrkommnr] = line['forradrkommnr']
        comp[:forradrkommnavn] = line['forradrkommnavn']
        comp[:forradrland] = line['forradrland']
        comp[:postadresse] = line['postadresse']
        comp[:ppostnr] = line['ppostnr']
        comp[:ppoststed] = line['ppoststed']
        comp[:ppostland] = line['ppostland']
        comp[:regifr] = to_b(line['regifr'])
        comp[:regimva] = to_b(line['regimva'])
        comp[:nkode1] = line['nkode1']
        comp[:nkode2] = line['nkode2']
        comp[:nkode3] = line['nkode3']
        comp[:sektorkode] = line['sektorkode']
        comp[:konkurs] = to_b(line['konkurs'])
        comp[:avvikling] = to_b(line['avvikling'])
        comp[:tvangsavvikling] = to_b(line['tvangsavvikling'])
        comp[:regiaa] = to_b(line['regiaa'])
        comp[:regifriv] = to_b(line['regifriv'])
        comp[:regdato] = to_date(line['regdato'])
        comp[:stiftelsesdato] = to_date(line['stiftelsesdato'])
        comp[:tlf] = line['tlf']
        comp[:tlf_mobil] = line['tlf_mobil']
        comp[:url] = line['url']
        comp[:regnskap] = line['regnskap']
        comp[:hovedenhet] = line['hovedenhet']
        comp[:ansatte_antall] = line['ansatte_antall']
        comp[:ansatte_dato] = to_date(line['ansatte_dato'])
        comp
      end

      def parse_companies
        csv_foreach(companies_csv_file).with_index do |line, index|
          logger.info("Parsing Company #{index}") if (index % 1_000).zero?
          comp = company_from_csv_line(line)
          g_company = Company.new(name: comp[:navn],
                                  incorporation_date: comp[:stiftelsesdato])
          g_company.save!
          

          comp[:cid] = g_company[:cid]
          #pp comp
          #pp g_company
          comp.save!
        end
      end

      def activity_from_csv_line(line)
        act = Registers::Norway::Dnn::Activity.new
        act[:code] = line['naerk']
        act[:name] = line['naerk_tekst']
        act[:name_eng] = line['naerk_tekst_engelsk']
        act
      end

      def parse_activities
        csv_foreach(activities_csv_file).with_index do |line, index|
          logger.info("Parsing Activity #{index}") if (index % 1_000).zero?
          act = activity_from_csv_line(line)
          act.save!
        end
      end

      def link_activities
        links_created = 0
        Registers::Norway::Dnn::Activity.find_each(batch_size: BUFFER_SIZE / 3) do |act|
          comps = Registers::Norway::Dnn::Company.where('nkode1 = ? OR nkode2 = ? OR nkode3 = ?',
                                                        act[:code], act[:code], act[:code])
          comps.readonly.select(:cid).find_each(batch_size: BUFFER_SIZE / 3) do |c|
            ca = Registers::Norway::Dnn::CompanyActivity.new(dnn_activity_id: act[:id],
                                                             cid: c[:cid])
            ca.save!
            links_created += 1
            if (links_created % 1_000).zero?
              logger.info("Added Company->Activity link #{links_created}")
            end
          end
        end
      end
      def perform(*_args)
        puts 'performing'
        ActiveRecord::Base.transaction do
          clear_database
          parse_companies
          parse_activities
          link_activities
        end
      end
    end


    desc 'Parse Norway DNN Datasets'
    task parse: :environment do
      Parser.new.perform
    end

  end
end
