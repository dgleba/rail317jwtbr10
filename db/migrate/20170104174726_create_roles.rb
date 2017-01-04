class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.integer :active_status
      t.integer :sort

      t.timestamps null: false
    end
  end
end
