class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  def edit
    @user = current_user
    @payment_data = PaymentInformation.find(@user.payment_information_id)
    # abort @payment_data.inspect
    @juristic_data = JuristicDocument.find(@user.juristic_document_id)
  end


  def update
    user = current_user
    juristic = JuristicDocument.find(user.juristic_document_id)
    payment_data = PaymentInformation.find(user.payment_information_id)

    user.update(user_params)
    juristic.update(juristic_params)
    payment_data.update(payment_params)

    redirect_to account_path
  end

  # POST /resource
  def create

    if params[:user][:juristic_document] != nil
      jur = JuristicDocument.create(:company_full_name=> juristic_params[:company_full_name],
        :company_short_name=> juristic_params[:company_short_name],
        :ceo_name=> juristic_params[:ceo_name],
        :legal_address=> juristic_params[:legal_address],
        :postal_address=> juristic_params[:postal_address],
        :inn=> juristic_params[:inn],
        :kpp=> juristic_params[:kpp],
        :ogrn=> juristic_params[:ogrn],
        :okpo=> juristic_params[:okpo],
        :okato=> juristic_params[:okato])

      paym = PaymentInformation.create(:payment_account=> payment_params[:payment_account],
        :bank_name=> payment_params[:bank_name],
        :bik=> payment_params[:bik],
        :bank_correspondent_account=> payment_params[:bank_correspondent_account])
        user = User.create!(:juristic_document_id=>jur.id, :payment_information_id => paym.id, :role => 0, :first_name => user_params[:first_name], :last_name => user_params[:last_name],:middle_name => user_params[:middle_name], :email => user_params[:email], :password => params[:user][:password])

    else
      generated_password = Devise.friendly_token.first(8)
      jur = JuristicDocument.create(:company_full_name=> ' ',
        :company_short_name=> ' ',
        :ceo_name=> ' ',
        :legal_address=> ' ',
        :postal_address=> ' ',
        :inn=> ' ',
        :kpp=> ' ',
        :ogrn=> ' ',
        :okpo=> ' ',
        :okato=> ' ')

      paym = PaymentInformation.create(:payment_account=> ' ',
        :bank_name=> ' ',
        :bik=> ' ',
        :bank_correspondent_account=> ' ')
      user = User.create!(:juristic_document_id=>jur.id, :payment_information_id => paym.id, :role => 0, :first_name => user_params[:first_name], :last_name => user_params[:last_name],:middle_name => user_params[:middle_name], :email => user_params[:email], :password => generated_password)
    end
    # puts generated_password
    # UserMailer.mailer(user, generated_password).deliver_now

    sign_in(user)

    redirect_to account_path
  end



  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :middle_name, :email, :phone_number)
    end
    def juristic_params
      params.require(:user).require(:juristic_document).permit(:company_full_name,:company_short_name,:ceo_name,:legal_address,:postal_address,
        :inn,:kpp,:ogrn,:okpo,:okato)
    end
    def payment_params
      params.require(:user).require(:payment_information).permit(:payment_account,:bank_name,:bik,:bank_correspondent_account)
    end
  end



  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
