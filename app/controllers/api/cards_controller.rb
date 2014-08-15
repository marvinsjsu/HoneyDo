class Api::CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def create
    @card = Card.new(card_params)

    if @card.save
   		render json: @card
    else
 			render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(card_params)
    	render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end

  private

  def card_params 
    params.require(:card).permit(:board_id, :list_id, :title)
  end

end