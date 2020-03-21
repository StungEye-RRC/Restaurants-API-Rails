class AddAmountToMeasuredIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :measured_ingredients, :amount, :integer
  end
end
