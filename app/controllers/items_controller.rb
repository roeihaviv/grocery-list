class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy move ]

  def move
    if @item.cart?
      @item.end_soon!
    elsif @item.end_soon?
      @item.in_stock!
    else
      @item.end_soon!
    end

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item updated" }

      format.js
    end
  end

  # GET /items or /items.json
  def index
    items = Item.where(category: "fruits")
    items.update_all(category: "<i class=\"fa-solid fa-apple-whole\"></i>")
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /items or /items.json
  def create
    @item = current_user.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:item, :related_items, :status, :category, :picture)
    
  end
end
