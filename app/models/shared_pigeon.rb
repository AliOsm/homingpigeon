class SharedPigeon < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user

  enum access: [:messages_only, :full_access]

  validates_presence_of :user_id
  validates_presence_of :access
end
