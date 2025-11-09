class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :menu

      t.timestamps
    end
  end
end
