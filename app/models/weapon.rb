class Weapon < ApplicationRecord
  has_many :events_weapons
  has_many :events, through: :events_weapons
end
