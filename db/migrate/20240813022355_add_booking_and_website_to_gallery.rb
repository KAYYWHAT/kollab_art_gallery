class AddBookingAndWebsiteToGallery < ActiveRecord::Migration[7.1]
  def change
    add_column :galleries, :booking, :string
    add_column :galleries, :website, :string
  end
end
