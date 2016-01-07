class AddIngredientIdToPizzaIngredients < ActiveRecord::Migration
  def change
    add_column :pizza_ingredients, :ingredient_id, :integer
  end
end
