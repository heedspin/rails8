class CreateProductComments < ActiveRecord::Migration[8.0]
  def change
    create_table :product_comments do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :author_name, null: false
      t.timestamps
    end
  end
end
