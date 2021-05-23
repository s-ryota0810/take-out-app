class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign: true
      t.references :shop, foreign: true
      t.string :title
      t.text  :content
      t.integer :star
      t.timestamps
    end
  end
end
