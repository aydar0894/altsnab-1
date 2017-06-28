class CategoryFieldsController < ApplicationController
  before_action :set_category_field, only: [:show, :edit, :update, :destroy]

  # GET /category_fields
  # GET /category_fields.json
  def index
    @category_fields = CategoryField.all
  end

  # GET /category_fields/1
  # GET /category_fields/1.json
  def show
  end

  # GET /item_category_fields/1.json
  def item_category_fields
    @category_id = params[:category_id]
    @item_id = params[:item_id]

    category_fields = CategoryField.where(category_id: @category_id).all

    category_field_values = []
    category_fields.each_with_index do |cf, index|
      category_field_value = cf.category_field_values.where(item_id: @item_id).first
      @value = category_field_value&.value ? category_field_value.value : ''
      category_field_values << {
        value: @value,
        name: cf.field.name,
        id: cf.field.id,
        cf_id: cf.id
      }
    end

    respond_to do |format|
      format.html {  }
      format.json { render json: category_field_values }
    end
  end

  # GET /category_fields/new
  def new
    @category_field = CategoryField.new
  end

  # GET /category_fields/1/edit
  def edit
  end

  # POST /category_fields
  # POST /category_fields.json
  def create
    @category_field = CategoryField.new(category_field_params)

    respond_to do |format|
      if @category_field.save
        format.html { redirect_to @category_field, notice: 'Category field was successfully created.' }
        format.json { render :show, status: :created, location: @category_field }
      else
        format.html { render :new }
        format.json { render json: @category_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_fields/1
  # PATCH/PUT /category_fields/1.json
  def update
    respond_to do |format|
      if @category_field.update(category_field_params)
        format.html { redirect_to @category_field, notice: 'Category field was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_field }
      else
        format.html { render :edit }
        format.json { render json: @category_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_fields/1
  # DELETE /category_fields/1.json
  def destroy
    @category_field.destroy
    respond_to do |format|
      format.html { redirect_to category_fields_url, notice: 'Category field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_field
      @category_field = CategoryField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_field_params
      params.require(:category_field).permit(:category_id, :field_id)
    end
end
