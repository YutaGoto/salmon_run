class Event < ApplicationRecord
  belongs_to :stage
  has_many :events_weapons
  has_many :weapons, through: :events_weapons
end
