class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(board_params)
      redirect_to boards_url(@board)
    else
      flash.now[:errors] = @board.errors.full_messages
      render :edit
    end
  end

  def new
    @board = Board.new()
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_url(@board)
    else
      flash.now[:errors] = @board.errors.full_messages
      render :new
    end
  end

  def delete

  end

  private 

  def board_params
    params.require(:board).permit(:title, :created_by);
  end

end