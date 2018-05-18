class Event < ApplicationRecord
  belongs_to :stage
  has_many :events_weapons
  has_many :weapons, through: :events_weapons

  scope :by_weapon_ids, -> (weapon_ids) {
    where(events_weapons: {weapon_id: weapon_ids})
  }
end
