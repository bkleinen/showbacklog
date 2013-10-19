class BacklogController < ApplicationController
  def show
    owner = URI.escape(params[:owner])
    repository = URI.escape(params[:repository])
    @issues = Issue.backlog(owner,repository)
  end
end
