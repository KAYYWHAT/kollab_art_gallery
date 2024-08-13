class Gallery < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
end
