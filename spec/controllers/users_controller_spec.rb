require 'spec_helper'

describe UsersController do

  describe "GET 'friend_request'" do
    it "returns http success" do
      get 'friend_request'
      response.should be_success
    end
  end

  describe "GET 'friend_accept'" do
    it "returns http success" do
      get 'friend_accept'
      response.should be_success
    end
  end

end
