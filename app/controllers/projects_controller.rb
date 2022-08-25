class ProjectsController < ApplicationController
  def index
    @latest_project = Project.order(updated_at: :desc).limit(1)
    # Donation.limit(4).order('sum_price desc').group(:project_id).sum(:price)
    @popular_project = Project.order(updated_at: :desc).limit(4)
    
  end

  def new
    @project = Project.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :image, :first_detail, :second_detail, :category_id, :select_donation_id, :donation_target_amount,
                                    :prefecture_id, user_ids: [])
  end

end
