require 'spec_helper'

describe "Landingpage" do
  it "shows link to gissues" do
    visit root_path
    page.should have_text 'Gissues'
  end

  it "has link to github repository" do
    visit root_path
    page.should have_link 'View this project on GitHub'
  end
end
