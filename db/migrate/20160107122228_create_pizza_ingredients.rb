class CreatePizzaIngredients < ActiveRecord::Migration
  def change
    create_table :pizza_ingredients do |t|

      t.timestamps null: false
    end
  end
end
