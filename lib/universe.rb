class Universe
  attr_reader :dimensions, :bodies

  def initialize(dimensions:, bodies:)
    @dimensions = dimensions
    @bodies = bodies
  end

  def evolve(dt)
    forces = bodies.map{ |_| zero_vector }

    # first compute all forces (left side of F = ma)
    each_pair_with_index do |(body_i, body_j, i, j)|
      forces[i] += body_i.force_from(body_j)
    end

    # then update the state at t + dt
    bodies.each_with_index do |_, i|
      a = forces[i] * (1.0 / bodies[i].mass)
      v = bodies[i].velocity 
      bodies[i].velocity += a * dt
      bodies[i].position += v * dt
      # v1 = v1 + a0t
      # x1 = x0 + v0t
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

  def zero_vector
    Vector.new(Array.new(dimensions, 0))
  end
  
  def each_pair_with_index
    # get all pairs of distinct bodies
    #
    #    1  2  3  4
    #  1    .  .  .
    #  2 .     .  .
    #  3 .  .     .
    #  4 .  .  .
    #
    bodies.each_with_index do |body_i, i|
      bodies.each_with_index do |body_j, j|
        next if i == j
        yield [body_i, body_j, i, j]
      end
    end
  end
end
