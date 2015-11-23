class AddApplicationToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :application, :string
  end
end
