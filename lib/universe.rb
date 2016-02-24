class Universe
  attr_reader :dimensions, :bodies

  def initialize(dimensions:, bodies:)
    @dimensions = dimensions
    @bodies = bodies
  end

  def evolve(dt)
    each_pair do |(body_i, body_j)|
      force_ij = body_i.force_from(body_j)
      # dv = (F/m)dt
      f_over_m = force_ij * (1.0/body_i.mass)
      body_i.velocity += f_over_m * dt
      body_i.position += body_i.velocity * dt
    end
  end

  def evolve_steps(dt, steps)
    steps.times { evolve(dt) }
  end

  def to_a
    @bodies.map(&:to_h)
  end

  def self.big?
    true
  end

  private
  
  def each_pair
    # get all pairs of distinct bodies
    #
    #    1  2  3  4
    #  1    .  .  .
    #  2 .     .  .
    #  3 .  .     .
    #  4 .  .  .
    #
    bodies.each do |body_i|
      bodies.each do |body_j|
        next if body_i == body_j
        yield [body_i, body_j]
      end
    end
  end
end
