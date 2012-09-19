require 'spec_helper'

describe "Basic pages" do

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/basic_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      visit '/basic_pages/home'
      page.should have_selector('title',
                                :text => "NFL Rails App")
    end

    it "should not have a custom page title" do
      visit '/basic_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/basic_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/basic_pages/help'
      page.should have_selector('title',
                                :text => "NFL Rails App | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/basic_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/basic_pages/about'
      page.should have_selector('title',
                                :text => "NFL Rails App | About Us")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/basic_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end

    it  "should have the title 'Contact'" do
      visit '/basic_pages/contact'
      page.should have_selector('title',
                                :text => "NFL Rails App | Contact")
    end
  end

  describe "Arizona Cardinals" do

    it "should have the h1 'NFC West'" do
      visit '/basic_pages/ari'
      page.should have_selector('h1', :text => 'NFC West')
    end

    it "should have the title 'Arizona Cardinals'" do
      visit '/basic_pages/ari'
      page.should have_selector('title',
                                :text => "NFL Rails App | Arizona Cardinals")
    end

  end

end