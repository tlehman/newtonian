class Universe
  attr_reader :dimensions, :bodies

  def initialize(dimensions:, bodies:)
    @dimensions = dimensions
    @bodies = bodies
  end

  def evolve(dt)
  end

  def self.big?
    true
  end
end
