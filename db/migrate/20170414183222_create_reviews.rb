class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :description
      t.integer :rating

      t.timestamps null: false

      t.references :product, foreign_key: true
    end
  end
end
