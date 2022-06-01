class CreateOderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_details do |t|

      t.timestamps
      
      t.integer :price
      t.integer :amount
      t.integer :making_status
    end
  end
end
