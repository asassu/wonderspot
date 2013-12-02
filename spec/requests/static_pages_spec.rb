require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Midnight'" do
      visit '/static_pages/home'
      expect(page).to have_content('Midnight')
    end
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Home")
    end
  end
  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("About")
    end
  end
end
