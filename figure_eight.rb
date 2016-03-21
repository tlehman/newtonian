# coding: utf-8
# Figure eight orbit
# from the paper by By Alain Chenciner and Richard Montgomery
# http://www.emis.de/journals/Annals/152_3/chencine.pdf
require './lib/newtonian'
require './lib/vector'
require './lib/body'
require './lib/universe'
require 'json'

module FigureEight
  def self.run
    dt = 0.001
    m = 1.0

    body1_pos = ::Vector.new([0.97000436, -0.24308753])
    body2_pos = body1_pos*(-1)
    body3_pos = ::Vector.new([0, 0])

    body3_vel = ::Vector.new([-0.93240737, -0.86473146])  # x3' = -2x1' and x1' = x2'
    body2_vel = body3_vel * (-0.5)
    body1_vel = body3_vel * (-0.5)
   
    body1 = Body.new(mass: m, position: body1_pos, velocity: body1_vel)
    body2 = Body.new(mass: m, position: body2_pos, velocity: body2_vel)
    body3 = Body.new(mass: m, position: body3_pos, velocity: body3_vel)
    
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
    
FigureEight.run
