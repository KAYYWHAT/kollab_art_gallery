class AddOwnerStatusToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :owner, :boolean, default: false
  end
end
