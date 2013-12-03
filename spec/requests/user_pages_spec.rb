require 'spec_helper'

describe "User pages" do

  describe "Registration Page" do

    it "should have the h1 'Register'" do
      visit register_path
      expect(page).to have_content('Register')
    end

    it "should have the title 'Register'" do
      visit register_path
      expect(page).to have_title("Midnight - Register")
    end
  end

end
