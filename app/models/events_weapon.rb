class EventsWeapon < ApplicationRecord
  belongs_to :event
  belongs_to :weapon
end
