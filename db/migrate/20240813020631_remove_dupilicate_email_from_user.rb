class RemoveDupilicateEmailFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :e_mail_address, :string
  end
end
