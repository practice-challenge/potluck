RSpec.describe Potluck do
  before do
    @potluck = Potluck.new("7-13-18")
  end

  it "exists" do
    expect(@potluck).to be_an_instance_of(Potluck)
  end

  it "has readable attributes" do
    expect(@potluck.date).to eql("7-13-18")
    expect(@potluck.dishes).to eql([])
  end
end
