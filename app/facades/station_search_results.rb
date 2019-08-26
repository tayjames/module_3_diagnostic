class StationSearchResults
  def initialize(zip)
    @zip = zip
  end

  def station_count
    stations.count
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |f|
      faraday.headers["X-API-KEY"] = ENV["API-KEY"]
    end
  end
end
