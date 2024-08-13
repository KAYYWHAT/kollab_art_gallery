class RemoveAvailabilityFromGallery < ActiveRecord::Migration[7.1]
  def change
    remove_column :galleries, :availability, :boolean
  end
end
