# typed: true
class Body
  attr_reader :mass
  attr_accessor :position, :velocity

  def initialize(mass:, position:, velocity:)
    @mass = mass
    @position = position.is_a?(Vector) ? position : Vector.new(position)
    @velocity = velocity.is_a?(Vector) ? velocity : Vector.new(velocity)
  end

  def force_from(body)
    rvec = body.position - position
    r = rvec.norm
    rhat = rvec * (1/r)
    threshold = 0.1
    if r < threshold
      rhat*0
    else
      rhat * (Newtonian.G * mass * body.mass / r**2)
    end
  end

  def to_h
    {m: mass, p: position.components, v: velocity.components}
  end

end
