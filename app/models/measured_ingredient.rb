class MeasuredIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  belongs_to :measurement
end
