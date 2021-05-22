class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.references :shop, null: false
      t.string :name, null: false
      t.integer :price
      t.timestamps
    end
  end
end
