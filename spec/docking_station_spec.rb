require "docking_station"
require "bike"

describe DockingStation do

  before(:each) do
    @docking_station = DockingStation.new
    @bike1 = Bike.new
    @bike2 = Bike.new
  end

  it "will release a bike" do
    @docking_station.dock(@bike1)
    expect(@docking_station.release_bike).to be_an_instance_of(Bike)
  end
  
  it "will release a bike that is working" do
    @docking_station.dock(@bike1) 
    bike = @docking_station.release_bike
    expect(bike.working?).to eq true
  end

  it "stores a bike on docking_station instance" do
    expect(@docking_station.dock(@bike1)).to eq [@bike1]
  end

  it "stores 2 bikes on docking_station instance" do
    @docking_station.dock(@bike1)
    expect(@docking_station.dock(@bike2)).to eq [@bike1, @bike2]
  end

  it "allows 'bikes' instance variable to be accessed directly" do
    @docking_station.dock(@bike1)
    expect(@docking_station.bikes).to eq [@bike1]
  end

  it "'release_bike' method raises an error if no bikes are available" do
    expect { @docking_station.release_bike }.to raise_error("No bikes available")
  end
  
  it "'dock' method raises an error if bike docked when the station is at capacity" do
    DockingStation::DEFAULT_CAPACITY.times { @docking_station.dock(Bike.new) }
    expect { @docking_station.dock(@bike1) }.to raise_error("Docking station full")
  end

  it "raise error if 'full?' private method called publicly" do
    expect { @docking_station.full? }.to raise_error(NoMethodError)
  end

  it "raise error if 'empty?' private method called publicly" do
    expect { @docking_station.empty? }.to raise_error(NoMethodError)
  end

end