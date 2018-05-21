class AddIsDeletedToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :is_deleted, :boolean, default: false
  end
end
