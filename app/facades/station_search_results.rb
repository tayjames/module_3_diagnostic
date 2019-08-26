class StationSearchResults
  def initialize(zip)
    @zip = zip
  end

  def station_count
    stations.count
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.headers["api_key"] = ENV["API_KEY"]
      f.adapter Faraday.default_adapter
    end

    response = conn.get("api/alt-fuel-stations/v1/nearest.json?location=80203&api_key=#{ENV["API_KEY"]}&radius=6.0&fuel_type=ELEC&access&limit=10")
    station_search_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    # binding.pry
    station_search_data.map do |station_data|
      Station.new(station_data)
    end
  end
end
