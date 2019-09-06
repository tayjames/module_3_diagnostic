class HouseMemberSearchResults
  def initialize(house)
    @house = house
  end

  def member_count
    members.count
  end

  def members
    service = WesterosService.new
    service.members_by_house.map do |house_data|
      House.new(house_data)
    end


    conn = Faraday.new(url: "http://westerosapi.herokuapp.com") do |faraday|
    faraday.adapter Faraday.default_adapter
  end

    response = conn.get("/api/v1/house/greyjoy?api_key=#{ENV["API_KEY"]}")
    house_data = JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:members]
    # binding.pry
    house_data.map do |house|
      House.new(house)
    end
  end

end
