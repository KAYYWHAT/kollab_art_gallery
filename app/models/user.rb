class User < ApplicationRecord
  has_many :galleries, dependent: :destroy
  has_many :applications, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_one_attached :profile_photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_save :upload_profile_photo_to_cloudinary

  def upload_profile_photo_to_cloudinary
    return unless profile_photo.attached?

    io = profile_photo.download
    result = Cloudinary::Uploader.upload(io, folder: 'profile_photos')
    self.profile_photo_url = result['secure_url']
    save
  rescue StandardError => e
    Rails.logger.error("Failed to upload profile photo to Cloudinary: #{e.message}")
  end
end
