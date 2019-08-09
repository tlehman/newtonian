# typed: true
# Random initial conditions
# yolo
require './lib/newtonian'
require './lib/vector'
require './lib/body'
require './lib/universe'
require 'json'

module RandomInit
  def self.run
    dt = 0.001
    bodies = rand(10).times.map { 
      Body.new(mass: 3*rand,
               position: [2*rand-1, 2*rand-1],
               velocity: [5*rand-2.5, 5*rand-2.5])
    }
    
    universe = Universe.new(dimensions: 2, bodies: bodies)
    
    i = 0
    loop do
      universe.evolve(dt)
      puts JSON.generate(universe.to_a)
      sleep dt
      i += 1
    end
  end
end
