class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :edit, :destroy]
    
  def index
    @rooms = Room.all
  end

  def show; end

  def new 
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "Room create successfull."
      redirect_to action: :show, id: @room.id
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(room_params)
      flash[:notice] = "Room update successfull."
      redirect_to action: :show, id: @room.id
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    flash[:notice] = "Room destroyed successfull."
    redirect_to action: :index
  end
  

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :status)
  end
end
