class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = self.current_user
  end

  def update
    @user = self.current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "Information Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "The clock strikes Midnight for you, too?"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,
                                   :description, :interests,
                                   :quotes)
    end
end
