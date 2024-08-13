class RemoveStatusFromApplication < ActiveRecord::Migration[7.1]
  def change
    remove_column :applications, :status, :boolean
  end
end
