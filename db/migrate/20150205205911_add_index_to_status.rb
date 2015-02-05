class AddIndexToStatus < ActiveRecord::Migration
  def change
    add_index :statuses, :created_at
  end
end
