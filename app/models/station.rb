class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type = attributes[:fuel_type]
    @distance = attributes[:distance]
    @access_time = attributes[:access_time]
  end
end
