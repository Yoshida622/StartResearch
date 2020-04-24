class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :station, presence: true, length: { maximum: 255 }
  validates :location, presence: true, length: { maximum: 255 }
  validates :money, presence: true, length: { maximum: 255 }
  validates :hour, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }

  has_many :keeps, dependent: :delete_all
  has_many :keep_users, through: :keeps, source: 'user'
  has_many :applications, dependent: :delete_all
  has_many :application_users, through: :applications, source: 'user'
end
