require 'spec_helper'

describe "Showbacklogs" do
  it "shows issues from the repository" do
    visit '/bkleinen/showbacklogtestissues'
    # 'Issue that should always be there.'
  end
end
