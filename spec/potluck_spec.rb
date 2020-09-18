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

  it "can get all dishes from category" do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    @potluck.add_dish(couscous_salad)
    @potluck.add_dish(summer_pizza)
    @potluck.add_dish(roast_pork)
    @potluck.add_dish(cocktail_meatballs)
    @potluck.add_dish(candy_salad)

    expect(@potluck.get_all_from_category(:appetizer)).to contain_exactly(couscous_salad, summer_pizza)
    expect(@potluck.get_all_from_category(:appetizer).first).to be(couscous_salad)
    expect(@potluck.get_all_from_category(:appetizer).first.name).to eql("Couscous Salad")
  end

  it "can return a hash by category as a menu" do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)
    @potluck.add_dish(couscous_salad)
    @potluck.add_dish(summer_pizza)
    @potluck.add_dish(roast_pork)
    @potluck.add_dish(cocktail_meatballs)
    @potluck.add_dish(candy_salad)
    @potluck.add_dish(bean_dip)

    expect(@potluck.menu).to eql({
      :appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
      :entres=>["Cocktail Meatballs", "Roast Pork"],
      :desserts=>["Candy Salad"]
      })
  end
end
