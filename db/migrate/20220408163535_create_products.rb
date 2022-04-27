class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.timestamps

      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, null: false, default: false

    end
  end
end
