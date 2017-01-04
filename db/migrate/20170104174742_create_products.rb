class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.datetime :pdate
      t.integer :active_status
      t.integer :sort

      t.timestamps null: false
    end
  end
end
