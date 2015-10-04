require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def clear_to_land(plane)
    fail "airport full" if full?
    land_plane(plane)
  end

  def clear_to_take_off
    fail "no planes waiting" if empty?
    take_off_plane
  end

  private

  def land_plane(plane)
    plane.land
    planes.push(plane)
    plane
  end

  def take_off_plane
    plane = planes.pop
    plane.take_off
    plane
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    planes.empty?
  end
end
