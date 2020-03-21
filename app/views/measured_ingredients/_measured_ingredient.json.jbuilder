json.extract! measured_ingredient, :id, :dish_id, :ingredient_id, :measurement_id, :created_at, :updated_at
json.url measured_ingredient_url(measured_ingredient, format: :json)
