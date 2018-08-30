class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exams, dependent: :destroy
  validates :name, length: {maximum: 40}
  validates_integrity_of :avatar
  validates_processing_of :avatar
end
