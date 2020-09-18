RSpec.describe Dish do
  before do
    @dish = Dish.new('Couscous Salad', :appetizer)
  end

  it 'exists' do
    expect(@dish).to be_an_instance_of(Dish)
  end

  it 'has readable attributes' do
    expect(@dish.name).to eql('Couscous Salad')
    expect(@dish.category).to eql(:appetizer)
  end
end
