require 'spec_helper'
using Trigonometry

describe Vector do
  let(:velocity) { Vector.new([3.0, -4.0]) }

  describe "#norm" do
    it "has a norm" do
      expect(velocity.norm).to eq(5.0)
    end
  end

  describe "#dot" do
    let(:vector_a) { Vector.new([1,0]) }
    let(:vector_b) { Vector.new([Math.cos(60.degrees),
                                 Math.sin(60.degrees)]) }

    it "equals the product of the norms times the cosine of the angle" do
      expect( vector_a.dot(vector_b) ).to eq(vector_a.norm *
                                             vector_b.norm *
                                             Math.cos(60.degrees))
    end

    context "when given a vector of another dimension" do
      let(:vector_a) { Vector.new([0.3, -0.223]) }
      let(:vector_b) { Vector.new([-1.1, 2.018, 0.338]) }

      it "raises a DimensionError" do
        expect {
          vector_a.dot(vector_b)
        }.to raise_error(Newtonian::DimensionError)
      end
    end
  end

end
