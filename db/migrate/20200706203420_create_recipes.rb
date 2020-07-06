class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :meal_id
      t.integer :ingredient_id
      t.string :measurements

      t.timestamps
    end
  end
end
