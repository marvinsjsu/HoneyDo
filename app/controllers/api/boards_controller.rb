class Api::BoardsController < ApplicationController

  def index
    @boards = Board.all
    render json: @boards
  end

  def show
    @board = Board.find(params[:id])
    render json: @board
  end

  def edit
    @board = Board.find(params[:id])
    render json: @board
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def new
    @board = Board.new()
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board
    else
      render json: @board.errors
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
  end

  private 

  def board_params
    params.require(:board).permit(:title, :created_by);
  end

end