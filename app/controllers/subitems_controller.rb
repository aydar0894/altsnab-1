class SubitemsController < ApplicationController
  before_action :set_subitem, only: [:show, :edit, :update, :destroy]

  # GET /subitems
  # GET /subitems.json
  def index
    @subitems = Subitem.all
  end

  # GET /subitems/1
  # GET /subitems/1.json
  def show
  end

  # GET /subitems/new
  def new
    @subitem = Subitem.new
  end

  # GET /subitems/1/edit
  def edit
  end

  # POST /subitems
  # POST /subitems.json
  def create
    @subitem = Subitem.new(subitem_params)

    respond_to do |format|
      if @subitem.save
        format.html { redirect_to @subitem, notice: 'Subitem was successfully created.' }
        format.json { render :show, status: :created, location: @subitem }
      else
        format.html { render :new }
        format.json { render json: @subitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subitems/1
  # PATCH/PUT /subitems/1.json
  def update
    respond_to do |format|
      #params[:subitem][:subitem_category_id] = subitem_cat_params[:id]
      #puts params[:subitem][:subitem_category_id]
      if @subitem.update(subitem_params)
        format.html { redirect_to @subitem, notice: 'Subitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @subitem }
      else
        format.html { render :edit }
        format.json { render json: @subitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subitems/1
  # DELETE /subitems/1.json
  def destroy
    @subitem.destroy
    respond_to do |format|
      format.html { redirect_to subitems_url, notice: 'Subitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subitem
      @subitem = Subitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subitem_params
      params.require(:subitem).permit(:name, :description, :price, :subitem_category_id, subitem_item_categories_attributes: [:id, :subitem_id, :category_id, :_destroy])
    end

    # def subitem_cat_params
    #   params.require(:subitem).permit(:id, )
    # end
end
