class UsersController < ApplicationController

  def get_friends
    @user = self.current_user
    friends = Array.new
    Friendships.find(:all, :conditions => { :user=>@user.id }).each do |f|
      friend = [User.find(f.friend).id, f.accepted].to_s
      friends << friend
    end
    Friendships.find(:all, :conditions => { :friend=>@user.id }).each do |f|
      friend = [User.find(f.user).id, f.accepted].to_s
      friends << friend
    end
    friends
  end

  def index
    @users = User.all
    @friends = get_friends()
  end

  def show
   # @id = url.match(/.*\=(\d+)/)[1]
   # @user = User.(@id)
    @user = User.find(params[:id])
    @friends = get_friends()
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
