class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.float :temperature
      t.float :humidity

      t.timestamps null: false
    end
  end
end
