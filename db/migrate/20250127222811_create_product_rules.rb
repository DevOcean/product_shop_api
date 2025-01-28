class CreateProductRules < ActiveRecord::Migration[7.2]
  def change
    create_table :product_rules do |t|
      t.references :product, null: false, foreign_key: true
      t.json :condition

      t.timestamps
    end
  end
end
