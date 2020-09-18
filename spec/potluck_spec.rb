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

  it "can add dish to dishes collection" do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    expect(@potluck.dishes).to eql([])

    @potluck.add_dish(couscous_salad)

    expect(@potluck.dishes).to eql([couscous_salad])

    @potluck.add_dish(cocktail_meatballs)

    expect(@potluck.dishes).to eql([couscous_salad, cocktail_meatballs])
    expect(@potluck.dishes.length).to eql(2)

  end
end
