class CategoryFieldValuesController < ApplicationController
  before_action :set_category_field_value, only: [:show, :edit, :update, :destroy]
  before_action :is_admin!
  
  # GET /category_field_values
  # GET /category_field_values.json
  # def index
  #   @category_field_values = CategoryFieldValue.all
  # end

  # GET /category_field_values/1
  # GET /category_field_values/1.json
  # def show
  # end

  # GET /category_field_values/new
  # def new
  #   @category_field_value = CategoryFieldValue.new
  # end

  # GET /category_field_values/1/edit
  # def edit
  # end

  # POST /category_field_values
  # POST /category_field_values.json
  # def create
  #   @category_field_value = CategoryFieldValue.new(category_field_value_params)
  #
  #   respond_to do |format|
  #     if @category_field_value.save
  #       format.html { redirect_to @category_field_value, notice: 'Category field value was successfully created.' }
  #       format.json { render :show, status: :created, location: @category_field_value }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @category_field_value.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /category_field_values/1
  # PATCH/PUT /category_field_values/1.json
  # def update
  #   respond_to do |format|
  #     if @category_field_value.update(category_field_value_params)
  #       format.html { redirect_to @category_field_value, notice: 'Category field value was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @category_field_value }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @category_field_value.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /category_field_values/1
  # DELETE /category_field_values/1.json
  # def destroy
  #   @category_field_value.destroy
  #   respond_to do |format|
  #     format.html { redirect_to category_field_values_url, notice: 'Category field value was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_category_field_value
    #   @category_field_value = CategoryFieldValue.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def category_field_value_params
    #   params.require(:category_field_value).permit(:item_id, :category_field_id, :value)
    # end
end
