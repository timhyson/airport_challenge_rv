class Plane
  attr_accessor :status

  def initialize
    @status = :flying
  end
  def landed?
    true if status == :landed
  end
  def flying?
    true if status == :flying
  end
  def land
    # fail 'already on the ground' if @flying == 'landed'
    @status = :landed
  end
  def take_off
    # fail 'already in the air' if @flying == 'flying'
    @status = :flying
  end
end
