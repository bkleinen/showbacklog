class BacklogController < ApplicationController
  def show
    # https://api.github.com/repos/learnery/learnery/issues
    @issues
  end
end
