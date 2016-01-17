require 'spec_helper'

using Trigonometry

describe Trigonometry do
  describe "#degrees" do
    it "converts pi/2 to 90 degrees" do
      expect(90.degrees).to eq(Math::PI/2)
    end
  end

  describe "#radians" do
    it "is the inverse of #degrees" do
      expect(27.degrees.radians).to eq(27)
    end
  end
end

