require_relative "./bike.rb"

class DockingStation
  attr_reader :bikes, :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    Bike.new
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
