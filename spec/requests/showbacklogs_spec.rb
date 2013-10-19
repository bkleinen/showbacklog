require 'spec_helper'

describe "Showbacklogs" do
  it "shows issues from the repository" do
    visit '/bkleinen/showbacklogtestissues'
    page.should have_text 'Issue that should always be there.'
  end

  it "should show backlog in order" do
    visit '/bkleinen/showbacklogtestissues'


  end
end
