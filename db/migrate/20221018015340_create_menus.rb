class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.belongs_to :business
      t.belongs_to :menu

      t.timestamps
    end
  end
end
