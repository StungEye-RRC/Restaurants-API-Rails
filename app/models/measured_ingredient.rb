# frozen_string_literal: true

class MeasuredIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  belongs_to :measurement

  validates :amount, numericality: { only_integer: true }
end
