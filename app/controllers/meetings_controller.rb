class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :edit, :destroy]
    
  def index
    @mettings = Meeting.all
  end

  def show; end

  def new 
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:notice] = "Meeting create successfull."
      redirect_to action: :show, id: @meeting.id
    else
      render :new
    end
  end

  def edit; end

  def update
    if @meeting.update(meeting_params)
      flash[:notice] = "Meeting update successfull."
      redirect_to action: :show, id: @meeting.id
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    flash[:notice] = "Meeting destroyed successfull."
    redirect_to action: :index
  end
  

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:user_id, :room_id, :name, :start_date, :end_date)
  end
end
