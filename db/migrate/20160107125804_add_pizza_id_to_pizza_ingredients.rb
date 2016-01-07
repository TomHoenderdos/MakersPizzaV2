class AddPizzaIdToPizzaIngredients < ActiveRecord::Migration
  def change
    add_column :pizza_ingredients, :pizza_id, :integer
  end
end
