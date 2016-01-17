module Trigonometry
  refine Numeric do
    def degrees
      (self*Math::PI / 180.0)
    end

    def radians
      self * (180/Math::PI)
    end
  end
end
