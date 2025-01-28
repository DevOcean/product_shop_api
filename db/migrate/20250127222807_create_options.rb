class CreateOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :options do |t|
      t.string :name
      t.references :part, null: false, foreign_key: true
      t.boolean :in_stock

      t.timestamps
    end
  end
end
