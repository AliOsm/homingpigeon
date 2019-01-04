class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :pigeons, dependent: :destroy
  has_many :pigeon_messages, dependent: :destroy
  has_many :shared_pigeons, dependent: :destroy
end
