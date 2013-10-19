class BacklogController < ApplicationController
  def show
    # https://api.github.com/repos/learnery/learnery/issues
    i = Issue.new
    i.title = "Hey."
    @issues = [ i ]
  end
end
