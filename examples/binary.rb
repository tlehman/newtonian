# Binary object orbit, equal mass, opposite velocities
# Nearly uniform circular motion
require './lib/newtonian'
require './lib/vector'
require './lib/body'
require './lib/universe'
require 'json'

module Newtonian

dt = 0.001
m = 10
r = 1.0
v = Math.sqrt((Newtonian.G * m) / (4 * r))
period = 2*Math::PI*r / v
half_period = period / 2
body1_pos = Vector.new([r,0])
body2_pos = Vector.new([-r,0])
body1 = Body.new(mass: m, position: body1_pos, velocity: [0,v])
body2 = Body.new(mass: m, position: body2_pos, velocity: [0,-v])

universe = Universe.new(dimensions: 2, bodies: [body1, body2])

loop do
  universe.evolve(dt)
  puts JSON.generate(universe.to_a)
  sleep dt
end


end
