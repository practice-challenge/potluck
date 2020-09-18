RSpec.describe Potluck do
  before do
    @potluck = Potluck.new("7-13-18")
  end
  
  it "exists" do
    expect(@potluck).to be_an_instance_of(Potluck)
  end
end
