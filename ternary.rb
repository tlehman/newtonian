# Orbit around binary orbit
require './lib/newtonian'
require './lib/vector'
require './lib/body'
require './lib/universe'
require 'json'

module ThreeBody
  def self.run
    dt = 0.001
    m = 1
    r = 0.1
    v = Math.sqrt((Newtonian.G * m) / (4 * r))
    period = 2*Math::PI*r / v
    half_period = period / 2
    body1_pos = ::Vector.new([r,0])
    body2_pos = ::Vector.new([-r,0])
    body3_pos = ::Vector.new([0,1])
    body1 = Body.new(mass: m, position: body1_pos, velocity: [0,v])
    body2 = Body.new(mass: m, position: body2_pos, velocity: [0,-v])
    body3 = Body.new(mass: m/100.0, position: body3_pos, velocity: [0, 0])
    
    universe = Universe.new(dimensions: 2, bodies: [body1, body2, body3])
    
    i = 0
    loop do
      universe.evolve(dt)
      puts JSON.generate(universe.to_a)
      sleep dt
      i += 1
    end
  end
end
    
ThreeBody.run
