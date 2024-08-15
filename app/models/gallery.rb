class Gallery < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :name, :address, :description, :price, :user_id, presence: true
  validates :address, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
