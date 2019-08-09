# typed: false
require "spec_helper"

describe Point do
  let(:point_a) { Point.new([3.0,0.0]) }
  let(:point_b) { Point.new([0.0,4.0]) }

  describe "#dimension" do
    it "has a dimension" do
      expect(point_a.dimension).to eq(2)
    end
  end

  # A point represents a position, the difference of points,
  # also known as a vector, represents a displacement.
  describe "#-" do
    it "returns a vector when subtracting another point" do
      expect(point_a - point_b).to be_a(Vector)
    end
  end

  describe "#distance" do
    it "gives the distance to another point" do
      expect(point_a.distance(point_b)).to eq(5.0)
    end

    context "when given a point of another dimension" do
      let(:hyper_point) { Point.new([0.901332, -0.026978, 0.676339, 0.591385]) }

      it "raises a DimensionError" do
        expect {
          point_a.distance(hyper_point)
        }.to raise_error(Newtonian::DimensionError)
      end
    end
  end

end
