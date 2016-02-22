Dir["lib/*.rb"].each { |f| require "./#{f}" }

module Newtonian
  class DimensionError < StandardError; end

  def self.G
    6.673*10**-11
  end
end
