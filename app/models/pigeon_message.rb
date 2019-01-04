class PigeonMessage < ApplicationRecord
  belongs_to :pigeon, counter_cache: true
  belongs_to :user

  validates_length_of :information, minimum: 1, maximum: 5000
end
