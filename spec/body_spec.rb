require 'spec_helper'

describe Body do
  let(:body) { Body.new(mass: 2, position: [0,0], velocity: [0,0]) }

  it "has mass" do
    expect(body.mass).to be_a(Numeric)
  end

  it "has a position" do
    expect(body.position).to be_a(Point)
  end

  it "has an instaneous velocity" do
    expect(body.velocity).to be_a(Vector)
  end

  describe "#force_from" do
    let(:m1) { body1.mass }
    let(:m2) { body2.mass }
    let(:r12) { body2.position - body1.position }
    let(:rhat) { r12 * (1/r12.norm) }
    let(:body1) { body }
    let(:body2) { Body.new(mass: 83.6, position: [3,4], velocity: [0,0]) }

    it "calculates the force vector on self from the body in the args" do
      expected_force_12 = rhat*(Newtonian.G * m1 * m2 / (r12.norm**2))
      expect(body1.force_from(body2)).to eq(expected_force_12)
    end

    it "gets the right value for the magnitude of the force" do
      expect(body1.force_from(body2).norm).to be_within(10E-12).of(4.4629E-10)
    end
  end

end
