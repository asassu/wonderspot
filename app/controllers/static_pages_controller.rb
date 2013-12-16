class StaticPagesController < ApplicationController
  def home
    if not self.current_user.nil?
      @microposts = Micropost.all
      @micropost = Micropost.new
      @user = self.current_user
    end
  end

  def help
  end

  def about
  end
end
