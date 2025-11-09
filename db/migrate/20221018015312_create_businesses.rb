class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.string :site_web

      t.timestamps
    end
  end
end
