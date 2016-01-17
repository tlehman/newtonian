class Body
  attr_reader :mass
  attr_accessor :position, :velocity

  def initialize(mass:, position:, velocity:)
    @mass = mass
    @position = position.is_a?(Point) ? position : Point.new(position)
    @velocity = velocity.is_a?(Vector) ? velocity : Vector.new(velocity)
  end

end
