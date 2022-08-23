class DonationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @project = Project.find(params[:project_id])
    @donation_address = DonationAddress.new
  end
  def create
    @project = Project.find(params[:project_id])
    @donation_address = DonationAddress.new(donation_params)
    if @donation_address.valid?
      @donation_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:donation_address).permit(:post_code, :prefecture_id, :municipality,
                                             :house_number, :building_name, :phone_number,
                                             :price).merge(user_id: current_user.id, project_id: @project.id)
  end

end