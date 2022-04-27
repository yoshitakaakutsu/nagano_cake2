class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|

      t.timestamps

      t.string :name
      t.string :postal_code
      t.string :adress

    end
  end
end
