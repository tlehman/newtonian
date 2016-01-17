class Vector
  attr_reader :components

  def initialize(components)
    @components = components
  end

  def dimension
    @components.length
  end

  def +(vector)
    if vector.dimension != dimension
      raise Newtonian::DimensionError
    end

    Vector.new(components.zip(vector.components).map {|(vi,wi)| vi+wi })
  end

  def *(scalar)
    Vector.new(components.map{|c| scalar*c })
  end

  def ==(vector)
    return false if vector.dimension != dimension

    components == vector.components
  end

  def norm
    Math.sqrt(dot(self))
  end

  def dot(vector)
    if vector.dimension != dimension
      raise Newtonian::DimensionError
    end

    components.zip(vector.components).map {|(vi,wi)| vi*wi }.inject(&:+)
  end
end
