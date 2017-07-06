class ShipmentInformationsController < ApplicationController
  before_action :set_shipment_information, only: [:show, :edit, :update, :destroy]

  # GET /shipment_informations
  # GET /shipment_informations.json
  def index
    @shipment_informations = ShipmentInformation.where(user_id: current_user.id)
  end

  # GET /shipment_informations/1
  # GET /shipment_informations/1.json
  def show
  end

  # GET /shipment_informations/new
  def new
    @shipment_information = ShipmentInformation.new
  end

  # GET /shipment_informations/1/edit
  def edit
  end

  # POST /shipment_informations
  # POST /shipment_informations.json
  def create

    @shipment_information = ShipmentInformation.new(shipment_information_params)
    @shipment_information.user_id = current_user.id
    respond_to do |format|
      if @shipment_information.save
        format.html { redirect_to @shipment_information, notice: 'Shipment information was successfully created.' }
        format.json { render :show, status: :created, location: @shipment_information }
      else
        format.html { render :new }
        format.json { render json: @shipment_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipment_informations/1
  # PATCH/PUT /shipment_informations/1.json
  def update
    respond_to do |format|
      if @shipment_information.update(shipment_information_params)
        format.html { redirect_to @shipment_information, notice: 'Shipment information was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment_information }
      else
        format.html { render :edit }
        format.json { render json: @shipment_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment_informations/1
  # DELETE /shipment_informations/1.json
  def destroy
    @shipment_information.destroy
    respond_to do |format|
      format.html { redirect_to shipment_informations_url, notice: 'Shipment information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment_information
      @shipment_information = ShipmentInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_information_params
      params.require(:shipment_information).permit(:country, :city, :address, :zip_code, :is_main)
    end
end
