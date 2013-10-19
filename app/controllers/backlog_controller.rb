class BacklogController < ApplicationController
  def show
    # https://api.github.com/repos/learnery/learnery/issues
    require 'open-uri'
    owner = URI.escape(params[:owner])
    repository = URI.escape(params[:repository])
    f = open("https://api.github.com/repos/#{owner}/#{repository}/issues")
    json = f.read
    parsed_json = ActiveSupport::JSON.decode(json)

#    first_issue = parsed_json.first
#    raise first_issue.inspect

    @issues = parsed_json.map { |j| Issue.new(j)}
  end
end
