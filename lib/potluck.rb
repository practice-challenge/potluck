class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    categorized_menu = @dishes.reduce({}) do |menu, dish|
      menu[dish.category] = [] if menu[dish.category].nil?
      menu[dish.category] << dish.name
      menu
    end

    pluralize_categories = categorized_menu.transform_keys do |key|
      (key.to_s << 's').to_sym
    end

    pluralize_categories.transform_values(&:sort)
  end
end
