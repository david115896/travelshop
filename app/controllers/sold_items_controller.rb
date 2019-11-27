class SoldItemsController < ApplicationController
  before_action :authenticate_user
  before_action :set_sold_item, only: [:show, :edit, :update, :destroy]

  def index
    @sold_items = SoldItem.all
  end

  def show
  end

  def new
    @sold_item = SoldItem.new
  end

  def edit
  end

  def create
    @sold_item = SoldItem.new(sold_item_params)

    respond_to do |format|
      if @sold_item.save
        format.html { redirect_to @sold_item, notice: 'Sold item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @sold_item.update(sold_item_params)
        format.html { redirect_to @sold_item, notice: 'Sold item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @sold_item.destroy
    respond_to do |format|
      format.html { redirect_to sold_items_url, notice: 'Sold item was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sold_item
      @sold_item = SoldItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sold_item_params
      params.fetch(:sold_item, {})
    end
end
