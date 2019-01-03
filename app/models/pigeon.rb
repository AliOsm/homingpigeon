class Pigeon < ApplicationRecord
  before_save :set_token

  belongs_to :user
  has_many :pigeon_messages, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, minimum: 3, maximum: 16
  validates_uniqueness_of :name, scope: :user_id

  validates_length_of :description, minimum: 0, maximum: 1024

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Pigeon.exists?(token: random_token)
    end
  end
end
