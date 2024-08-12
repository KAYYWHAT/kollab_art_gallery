class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
