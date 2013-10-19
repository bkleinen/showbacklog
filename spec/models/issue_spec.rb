require 'spec_helper'

describe Issue do
  it "should initialize itself from a json hash" do
    json_hash = {"url"=>"https://api.github.com/repos/learnery/learnery/issues/46", "labels_url"=>"https://api.github.com/repos/learnery/learnery/issues/46/labels{/name}", "comments_url"=>"https://api.github.com/repos/learnery/learnery/issues/46/comments", "events_url"=>"https://api.github.com/repos/learnery/learnery/issues/46/events", "html_url"=>"https://github.com/learnery/learnery/issues/46", "id"=>20925688, "number"=>46, "title"=>"ask applicants to re-confirm", "user"=>{"login"=>"titanoboa", "id"=>226148, "avatar_url"=>"https://1.gravatar.com/avatar/5e8e44a4f6632772c47925006aff31d9?d=https%3A%2F%2Fidenticons.github.com%2Fb6cdb531378c157a89ed4f683641f34f.png", "gravatar_id"=>"5e8e44a4f6632772c47925006aff31d9", "url"=>"https://api.github.com/users/titanoboa", "html_url"=>"https://github.com/titanoboa", "followers_url"=>"https://api.github.com/users/titanoboa/followers", "following_url"=>"https://api.github.com/users/titanoboa/following{/other_user}", "gists_url"=>"https://api.github.com/users/titanoboa/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/titanoboa/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/titanoboa/subscriptions", "organizations_url"=>"https://api.github.com/users/titanoboa/orgs", "repos_url"=>"https://api.github.com/users/titanoboa/repos", "events_url"=>"https://api.github.com/users/titanoboa/events{/privacy}", "received_events_url"=>"https://api.github.com/users/titanoboa/received_events", "type"=>"User", "site_admin"=>false}, "labels"=>[], "state"=>"open", "assignee"=>nil, "milestone"=>nil, "comments"=>0, "created_at"=>"2013-10-13T12:09:31Z", "updated_at"=>"2013-10-13T12:09:31Z", "closed_at"=>nil, "pull_request"=>{"html_url"=>nil, "diff_url"=>nil, "patch_url"=>nil}, "body"=>"As an event organizer planning an event with application, I want applicants to re-confirm their participaton when I've chosen to accept their application."}
    issue = Issue.new(json_hash)
    expect(issue.title).to eq("ask applicants to re-confirm")
  end

  it "should pick gissues order from body" do
    i = Issue.new
    i.body = "bla bla @gissues:{\"order\":50,\"status\":\"backlog\"} foo bla"
    i.parse_gissues_info_from_body
    expect(i.gissues_order).to eq(50)
    expect(i.gissues_status).to eq('backlog')
  end
  it "should pick gissues status from body" do
    i = Issue.new
    i.body = "bla bla @gissues:{\"order\":50,\"status\":\"backlog\"} foo bla"
    i.parse_gissues_info_from_body
    expect(i.gissues_status).to eq('backlog')
  end

  it "should find_gissues_info" do
    i = Issue.new
    i.body =" @gissues:{\"order\":87.5,\"status\":\"backlog\"}"
    expect(i.find_gissues_info(i.body)).to eq("{\"order\":87.5,\"status\":\"backlog\"}")
  end
  it "should find_gissues_info in longer string" do
    i = Issue.new
    i.body = "bla bla @gissues:{\"order\":50,\"status\":\"backlog\"} foo bla"
    expect(i.find_gissues_info(i.body)).to eq("{\"order\":50,\"status\":\"backlog\"}")
  end

  it "should parse json" do
    i = Issue.new
    json = i.parse_json("{\"order\":87.5,\"status\":\"backlog\"}")
    expect(json["order"]).to eq(87.5)
  end

end
