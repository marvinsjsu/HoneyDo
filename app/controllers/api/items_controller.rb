class Api::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
    	render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
  	@item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params 
    params.require(:item).permit(:card_id, :name, :description)
  end

end