class Application < ApplicationRecord
  belongs_to :user
  belongs_to :gallery
  has_many_attached :photos

  validates :start_date, :end_date, :description, presence: true
end
