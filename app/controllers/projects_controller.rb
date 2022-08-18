class ProjectsController < ApplicationController
  def index
  end

  def new
    @affiliation = Affiliation.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @affiliation = Affiliation.new(affiliation_params)
    if @affiliation.valid?
      @affiliation.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def affiliation_params
    params.require(:affiliation).permit(:title, :first_detail, :second_detail, :category_id, :select_donation_id, :donation_target_amount_id, :prefecture_id,
                                  {images: []}).merge(user_id: current_user.id)
  end

end
