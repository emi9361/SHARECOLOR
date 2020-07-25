class UsersController < ApplicationController
  before_action :set_locale

  def index
  end

  def show
    @user = current_user
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def create

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :profile_image, :introduction)
  end

  def set_locale
    I18n.locale = :ja
  end

end
