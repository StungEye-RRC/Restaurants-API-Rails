# frozen_string_literal: true

class Measurement < ApplicationRecord
  validates :name, presence: true
end
