class SubitemFieldsController < ApplicationController
  before_action :set_subitem_field, only: [:show, :edit, :update, :destroy]

  # GET /subitem_fields
  # GET /subitem_fields.json
  def index
    @subitem_fields = SubitemField.all
  end

  # GET /subitem_fields/1
  # GET /subitem_fields/1.json
  def show
  end

  # GET /subitem_fields/new
  def new
    @subitem_field = SubitemField.new
  end

  # GET /subitem_fields/1/edit
  def edit
  end

  # POST /subitem_fields
  # POST /subitem_fields.json
  def create
    @subitem_field = SubitemField.new(subitem_field_params)

    respond_to do |format|
      if @subitem_field.save
        format.html { redirect_to @subitem_field, notice: 'Subitem field was successfully created.' }
        format.json { render :show, status: :created, location: @subitem_field }
      else
        format.html { render :new }
        format.json { render json: @subitem_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subitem_fields/1
  # PATCH/PUT /subitem_fields/1.json
  def update
    respond_to do |format|
      if @subitem_field.update(subitem_field_params)
        format.html { redirect_to @subitem_field, notice: 'Subitem field was successfully updated.' }
        format.json { render :show, status: :ok, location: @subitem_field }
      else
        format.html { render :edit }
        format.json { render json: @subitem_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subitem_fields/1
  # DELETE /subitem_fields/1.json
  def destroy
    @subitem_field.destroy
    respond_to do |format|
      format.html { redirect_to subitem_fields_url, notice: 'Subitem field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subitem_field
      @subitem_field = SubitemField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subitem_field_params
      params.require(:subitem_field).permit(:name, :description)
    end
end
