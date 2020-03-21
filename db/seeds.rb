# frozen_string_literal: true

MEASUREMENTS = %w[milliliter liter milligram gram].freeze
NUMBER_OF_INGREDIENTS = 100
NUMBER_OF_RESTAURANTS = 10
DISHES_PER_RESTAURANT = 5
INGREDIENTS_PER_DISH  = 6
MEASUREMENT_AMOUNT_RANGE = (1..100).freeze

def creation_check(model, expected_count)
  if expected_count != model.count
    puts "#{model} Issue! Wanted: #{expected_count} Created: #{model.count}"
  else
    puts "#{model.count} #{model} Objects Created"
  end
end

def sample_model(model, count)
  model.offset(rand(model.count - count)).limit(count)
end

MEASUREMENTS.each do |measurement|
  Measurement.create(name: measurement)
end

measurements = Measurement.all

NUMBER_OF_INGREDIENTS.times do
  Ingredient.create(name: Faker::Food.unique.ingredient)
end

NUMBER_OF_RESTAURANTS.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.unique.name, description: Faker::Restaurant.unique.description)

  DISHES_PER_RESTAURANT.times do
    dish = restaurant.dishes.create(name: Faker::Food.unique.dish)

    downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{dish.name}"))
    dish.image.attach(io: downloaded_image, filename: "image-#{dish.name}.jpg")

    ingredients = sample_model(Ingredient, INGREDIENTS_PER_DISH)

    ingredients.each do |ingredient|
      dish.measured_ingredients.create(
        amount: rand(MEASUREMENT_AMOUNT_RANGE),
        ingredient: ingredient,
        measurement: measurements.sample
      )
    end
  end
end

creation_check(Measurement, MEASUREMENTS.size)
creation_check(Restaurant, NUMBER_OF_RESTAURANTS)
creation_check(Ingredient, NUMBER_OF_INGREDIENTS)
creation_check(Dish, NUMBER_OF_RESTAURANTS * DISHES_PER_RESTAURANT)
creation_check(MeasuredIngredient, NUMBER_OF_RESTAURANTS * DISHES_PER_RESTAURANT * INGREDIENTS_PER_DISH)
