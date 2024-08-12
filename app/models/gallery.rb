class Gallery < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
end
