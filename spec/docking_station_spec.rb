require "docking_station"
require "bike"

describe DockingStation do
  it "will respond to release_bike" do
    instance = DockingStation.new
    expect(instance).to respond_to(:release_bike)
  end

  it "will release a bike" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike).to be_an_instance_of(Bike)
  end

  it "will release a bike that is working" do 
    docking_station = DockingStation.new
    bike = docking_station.release_bike
    expect(bike.working?).to eq true
  end
end