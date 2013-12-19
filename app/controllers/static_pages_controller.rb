class StaticPagesController < ApplicationController

  def get_friends(user)
    if user.nil?
        @user = self.current_user
    else
        @user = user
    end

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

  def home
    if not self.current_user.nil?
      @user = self.current_user
      @friends = get_friends(@user)
      @microposts = Micropost.all.reverse
      #@microposts = Array.new
      #Friendships.where(friend: @user).each do |friend|
      #  @microposts << Micropost.where(user: friend)
      #end
      #@microposts = @microposts.reverse
      @micropost = Micropost.new
    end
  end

  def help
  end

  def about
  end
end
