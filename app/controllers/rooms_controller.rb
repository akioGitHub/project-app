class RoomsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  end
  
  def new
    @room = Room.new
  end

  def create
    @prject = Project.find(params[:project_id])
    @room = Room.new(room_params)
    if @room.save
      redirect_to project_rooms_path(current_user)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name, user_ids: []).merge(project_id: @prject.id)
  end

end
