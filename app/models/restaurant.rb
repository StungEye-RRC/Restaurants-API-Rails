# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :dishes

  validates :name, :description, presence: true
end
