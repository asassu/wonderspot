class FriendController < ApplicationController
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

  def show
    @user = self.current_user
    @friends = get_friends()
    if @friends.include?([Integer(params[:id]), false].to_s)
      accept_friend(Integer(params[:id]))
    else
      request_friend(params[:id])
    end
    redirect_to "/users"
  end

  def request_friend(userid)
    @user = self.current_user
    friend = User.find(userid)
    if not friend.nil?
      exists = Friendships.find(:all, :conditions => {:user => @user.id,
                                                          :friend => friend.id})
      p exists
      if exists == []
        friendship = Friendships.new(:user => @user.id,
                                     :friend => friend.id,
                                     :accepted => false)
        friendship.save
      end
    end
  end

  def accept_friend(userid)
    @user = self.current_user
    friend = User.find(userid)
    if not friend.nil?
      friendship = Friendships.find(:all, :conditions => {:user => @user.id,
                                                          :friend => friend.id})[0]
      if not friendship.nil?
        friendship.accepted = true
        friendship.save
      end
    end
  end
end
