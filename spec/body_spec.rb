require 'spec_helper'

describe Body do
  let(:body) { Body.new(mass: 1, position: [0,0], velocity: [0,0]) }

  it "has mass" do
    expect(body.mass).to be_a(Numeric)
  end

  it "has a position" do
    expect(body.position).to be_a(Point)
  end

  it "has an instaneous velocity" do
    expect(body.velocity).to be_a(Vector)
  end

end
