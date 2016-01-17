require 'spec_helper'

describe Universe do

  it "is really big" do
    expect(Universe).to be_big
  end

  describe "#evolve" do
    context "when dt is 1 second" do
      let(:dt) { 1.0 }
      let(:universe) { Universe.new(dimensions: 2, bodies: bodies) }
      let(:bodies) { [
        Body.new(mass: 20, position: [1,3], velocity: [0,0]),
        Body.new(mass: 30, position: [0,2], velocity: [0,0]),
      ]}

      it "updates the positions of all the bodies according to Newton's laws" do
        universe.evolve(dt)
        expect(universe.bodies.map(&:position)).to eq([
          Point.new([]),
          Point.new([]),
        ])
      end

    end

  end
end
