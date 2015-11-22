class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :app_name
      t.string :dev_resource
      t.references :wikis, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
