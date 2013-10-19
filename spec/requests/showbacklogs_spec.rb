require 'spec_helper'

describe "Showbacklogs" do
  it "shows issues from the repository" do
    visit '/bkleinen/showbacklogtestissues'
    page.should have_text 'Issue that should always be there.'
  end

  it "should show backlog in order" do
    visit '/bkleinen/showbacklogtestissues'
    "Issue A".should appear_before("Issue B")
  end
  it "should show backlog in order" do
    visit '/bkleinen/showbacklogtestissues'
    "Issue A".should appear_before("Issue C")
  end
  it "should show backlog in order" do
    visit '/bkleinen/showbacklogtestissues'
    "Issue B".should appear_before("Issue C")
  end
end
