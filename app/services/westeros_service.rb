class WesterosService
  def members_by_house
    conn = Faraday.new(url: "http://westerosapi.herokuapp.com") do |faraday|
    faraday.adapter Faraday.default_adapter
  end
    response = conn.get("/api/v1/house/greyjoy?api_key=#{ENV["API_KEY"]}")
    JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:members]
  end
end
