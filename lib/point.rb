class Point
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def dimension
    coordinates.length
  end

  def -(point)
    if point.dimension != dimension
      raise Newtonian::DimensionError
    end

    diffs = coordinates.zip(point.coordinates).map {|(ui,vi)| ui-vi }
    ::Vector.new(diffs)
  end

  def distance(point)
    if point.dimension != dimension
      raise Newtonian::DimensionError
    end

    (self - point).norm
  end
end
