class SubitemCategoriesController < ApplicationController
  before_action :set_subitem_category, only: [:show, :edit, :update, :destroy]

  # GET /subitem_categories
  # GET /subitem_categories.json
  def index
    @subitem_categories = SubitemCategory.all
  end

  # GET /subitem_categories/1
  # GET /subitem_categories/1.json
  def show
  end

  # GET /subitem_categories/new
  def new
    @subitem_category = SubitemCategory.new
  end

  # GET /subitem_categories/1/edit
  def edit
  end

  # POST /subitem_categories
  # POST /subitem_categories.json
  def create
    @subitem_category = SubitemCategory.new(subitem_category_params)

    respond_to do |format|
      if @subitem_category.save
        format.html { redirect_to @subitem_category, notice: 'Subitem category was successfully created.' }
        format.json { render :show, status: :created, location: @subitem_category }
      else
        format.html { render :new }
        format.json { render json: @subitem_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subitem_categories/1
  # PATCH/PUT /subitem_categories/1.json
  def update
    respond_to do |format|
      if @subitem_category.update(subitem_category_params)
        format.html { redirect_to @subitem_category, notice: 'Subitem category was successfully updated.' }
        format.json { render :show, status: :ok, location: @subitem_category }
      else
        format.html { render :edit }
        format.json { render json: @subitem_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subitem_categories/1
  # DELETE /subitem_categories/1.json
  def destroy
    @subitem_category.destroy
    respond_to do |format|
      format.html { redirect_to subitem_categories_url, notice: 'Subitem category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subitem_category
      @subitem_category = SubitemCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subitem_category_params
      params.require(:subitem_category).permit(:name)
    end
end
