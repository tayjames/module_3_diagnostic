require "rails_helper"

describe Station do
  it "exists" do
    attributes = {
      name: "Gas n Go",
      address: "123 Broadway St.",
      fuel_type: "Electric",
      distance: 12,
      access_time: "24 hrs"
    }

    station_1 = Station.new(attributes)

    expect(station_1).to be_a Station
    expect(station_1.name).to eq("Gas n Go")
    expect(station_1.address).to eq("123 Broadway St.")
    expect(station_1.fuel_type).to eq("Electric")
    expect(station_1.distance).to eq(12)
    expect(station_1.access_time).to eq("24 hrs")
  end
end
