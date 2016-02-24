require 'spec_helper'

describe Universe do

  it "is really big" do
    expect(Universe).to be_big
  end

  describe "#evolve_steps" do
    context "for a binary star system, two equal masses" do
      let(:dt) { 0.001 }
      let(:m) { 10 }
      let(:r) { 1.0 }
      let(:v) { Math.sqrt((Newtonian.G * m) / (4 * r)) }
      let(:period) { 2*Math::PI*r / v }
      let(:half_period) { period / 2 }
      let(:universe) { Universe.new(dimensions: 2, bodies: [body1, body2]) }
      let(:body1_pos) { Vector.new([r,0]) }
      let(:body2_pos) { Vector.new([-r,0]) }
      let(:body1) { Body.new(mass: m, position: body1_pos, velocity: [0,v]) }
      let(:body2) { Body.new(mass: m, position: body2_pos, velocity: [0,-v]) }
      let(:steps) { (half_period/dt).round }

      it "updates the positions of all the bodies according to Newton's laws" do
        universe.evolve_steps(dt, steps)

        # specifically, the two stars move around half an orbit and switch places
        body1_new_pos, body2_new_pos = universe.bodies.map(&:position)
        expect(body1_pos).to be_within(0.01).of(body2_new_pos)
        expect(body2_pos).to be_within(0.01).of(body1_new_pos)
      end

    end

  end
end
