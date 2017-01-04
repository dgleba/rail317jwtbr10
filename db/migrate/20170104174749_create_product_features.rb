class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.string :name
      t.references :product, index: true, foreign_key: true
      t.references :pfeature, index: true, foreign_key: true
      t.integer :active_status
      t.integer :sort

      t.timestamps null: false
    end
  end
end
