class Issue
  attr_accessor :title, :number, :id, :html_url, :url, :state, :body, :gissues_order, :gissues_status

  def initialize(json_hash = {})
    initialize_from_json_hash(json_hash)
  end

  def initialize_from_json_hash(json_hash)
    json_hash.each { | k,v|
      method = "#{k}="
      send(method,v) if respond_to?(method)
    }
    parse_gissues_info_from_body
  end

  def parse_gissues_info_from_body
    if issue_info = find_gissues_info(body) and json_hash = parse_json(issue_info)
      #raise issue_info
      @gissues_order= json_hash["order"].to_f
      @gissues_status= json_hash["status"]
    end
  end

  def find_gissues_info(body)
    match = /@gissues:(\{.*\})/.match(body)
    return match[1] if match
  end

  def parse_json(issue_info)
    ActiveSupport::JSON.decode(issue_info) rescue nil
  end

end
