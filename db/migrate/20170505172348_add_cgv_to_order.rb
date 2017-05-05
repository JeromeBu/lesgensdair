class AddCgvToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cgv, :boolean, default: false
  end
end
