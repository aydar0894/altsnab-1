class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.order(:id)
  end

  # GET /catalog(/:category_id)
  def catalog
    if params[:category_id]
      category = Category.find(params[:category_id])
      if category
        @side_opened_category_id = category.parent_category_id
        @current_category_id = category.id
        @items = Item.where(category_id: @current_category_id)
      end
    end

    @items ||= Item.all.order(:id) # If no category

    @child_categories = {}
    @all_categories = Category.all
    @head_categories = @all_categories.select { |cat| cat.parent_category_id.nil? }
    @all_categories.each do |cat|
      if !cat.parent_category_id.nil?
        if @child_categories[cat.parent_category_id].nil?
          @child_categories[cat.parent_category_id] = [cat]
        else
          @child_categories[cat.parent_category_id] << cat
        end
      end
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
      @field_values = CategoryFieldValue.joins(:category_field).where(item_id: @item.id, category_fields: { category_id: @item.category_id }).all.select{ |fv| !fv.category_field.nil? }
  end

  # GET /items/new
  def new
    @item = Item.new
    @category_fields = CategoryField.where(category_id: Category.first).all
  end

  # GET /items/1/edit
  def edit
      # @field_values = CategoryFieldValue.where(item_id: @item.id).all.select{ |fv| !fv.category_field.nil? }
      @category_fields = CategoryField.where(category_id: @item.category_id).all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        category_field_values = []
        params[:item_field].each do |key, value|
          category_field_values << { item_id: @item.id, category_field_id: key, value: value }
        end
        CategoryFieldValue.create(category_field_values)
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    # abort params[:item_field].inspect
    # abort params[:id].inspect

    respond_to do |format|
      if @item.update(item_params)
        params[:item_field].each do |key, value|
          cfv = CategoryFieldValue.where(item_id: params[:id], category_field_id: key).first
          if cfv.nil?
            CategoryFieldValue.create(item_id: params[:id], category_field_id: key, value: value)
          else
            if cfv.value != value
              cfv.value = value
              cfv.save
            end
          end
        end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :category_id, :price, :image)
    end
end
