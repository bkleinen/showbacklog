class Issue
  attr_accessor :title, :number, :id, :html_url, :url, :state

  def initialize(json_hash = {})
    initialize_from_json_hash(json_hash)
  end

  def initialize_from_json_hash(json_hash)
    json_hash.each { | k,v|
      method = "#{k}="
      send(method,v) if respond_to?(method)
    }
  end

end
