def mcdo_calories

  {"Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170}
end

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  mcdo_calories[burger] +
  mcdo_calories[side] +
  mcdo_calories[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  mcdo_calories_plus_menu = mcdo_calories

  mcdo_calories_plus_menu["Happy Meal"] =
  calculate_menu_calories("Cheese Burger", "French fries", "Coca")

  mcdo_calories_plus_menu["Best Of Big Mac"] =
  calculate_menu_calories("Big Mac", "French fries", "Coca")

  mcdo_calories_plus_menu["Best Of Royal Cheese"] =
  calculate_menu_calories("Royal Cheese", "Potatoes", "Sprite")

  products_calories = orders.map do |order|
    mcdo_calories_plus_menu[order] # get calories for each product (including menus)
  end

  products_calories.reduce(:+) # Compute sum
end

def calculate_menu_calories(*products)
  products_calories = products.map do |product|
    mcdo_calories[product] # get calories for each product
  end

  products_calories.reduce(:+) # Compute sum
end
