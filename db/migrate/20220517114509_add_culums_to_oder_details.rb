class AddCulumsToOderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :oder_details, :order_id, :integer
    add_column :oder_details, :product_id, :integer
  end
end
