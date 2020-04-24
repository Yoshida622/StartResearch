class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :keeps, dependent: :delete_all
  has_many :keep_posts, through: :keeps, source: 'post'
  has_many :applications, dependent: :delete_all
  has_many :application_posts, through: :applications, source: 'post'
end
