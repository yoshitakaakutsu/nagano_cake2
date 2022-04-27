class RemoveItemIdFromCartItems < ActiveRecord::Migration[6.1]
  def up
    remove_column :cart_items, :item_id
  end

  def down
    add_column :cart_items, :item_id, :integer
  end
end
