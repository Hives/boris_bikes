require_relative "./bike.rb"

class DockingStation
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bikes << bike
  end

  def display_bikes
    @bikes
  end
end
