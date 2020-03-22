# frozen_string_literal: true

json.extract! dish, :id, :name, :created_at, :updated_at
json.url dish_url(dish, format: :json)
json.image_url url_for(dish.image)
json.thumbnail_url rails_representation_url(dish.image.variant(resize: '200x200').processed, only_path: true)

json.restaurant do
  json.id dish.restaurant.id
  json.name dish.restaurant.name
  json.url restaurant_url(dish.restaurant, format: :json)
end

json.ingredients dish.measured_ingredients do |measured_ingredient|
  json.id measured_ingredient.ingredient.id
  json.name measured_ingredient.ingredient.name
  json.amount measured_ingredient.amount
  json.measurement measured_ingredient.measurement.name
  json.url ingredient_url(measured_ingredient.ingredient, format: :json)
end
