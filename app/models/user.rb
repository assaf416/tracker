class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :fleets
  # before_save :import_file

  has_many :devices

  def import_file
    unless self.image_url.nil?
      downloaded_image = open(self.image_url)
      self.avatar.attach(io: downloaded_image, filename: "avatar-#{self.id}.png")
    end
  end
end
