class AddAttributesToProductModel < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string, limit: 30
    add_column :products, :description, :string
  end
end
