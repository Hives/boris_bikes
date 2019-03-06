require "docking_station"
require "bike"

describe DockingStation do

  before(:each) do
    @docking_station = DockingStation.new
  end

  it "will respond to release_bike" do
    expect(@docking_station).to respond_to(:release_bike)
  end

  it "will release a bike" do
    expect(@docking_station.release_bike).to be_an_instance_of(Bike)
  end

  it "will release a bike that is working" do 
    bike = @docking_station.release_bike
    expect(bike.working?).to eq true
  end

  it "responds to the 'dock' method" do
    expect(@docking_station).to respond_to(:dock)
  end

  it "stores a bike on docking_station instance" do
    bike = Bike.new
    expect(@docking_station.dock(bike)).to eq [bike]
  end

  it "stores 2 bikes on docking_station instance" do
    bike1 = Bike.new
    bike2 = Bike.new
    @docking_station.dock(bike1)
    expect(@docking_station.dock(bike2)).to eq [bike1, bike2]
  end

  it "responds to 'display_bikes' by returning bikes stored on docking_station" do
    bike1 = Bike.new
    bike2 = Bike.new
    @docking_station.dock(bike1)
    @docking_station.dock(bike2)
    expect(@docking_station.display_bikes).to eq [bike1, bike2]
  end

  it "allows 'bikes' instance variable to be accessed directly" do
    bike1 = Bike.new
    bike2 = Bike.new
    @docking_station.dock(bike1)
    @docking_station.dock(bike2)
    expect(@docking_station.bikes).to eq [bike1, bike2]
  end

end