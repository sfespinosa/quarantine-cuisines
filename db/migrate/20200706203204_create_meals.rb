class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :category
      t.string :area
      t.string :instructions
      t.string :image_url
      t.string :source

      t.timestamps
    end
  end
end
