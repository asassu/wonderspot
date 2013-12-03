require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Midnight'" do
      visit root_path
      expect(page).to have_content('Midnight')
    end

    it "should have the home title" do
      visit root_path
      expect(page).to have_title("Midnight - Home")
    end

  end

  describe "About page" do

    it "should have the h1 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit about_path
      expect(page).to have_title("Midnight - About")
    end
  end
end
