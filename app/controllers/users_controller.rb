class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
      sign_in(current_user, :bypass => true)
    else
      render template: "devise/registrations/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :sex_id, :birthday, :password, :password_confirmation)
  end

end
