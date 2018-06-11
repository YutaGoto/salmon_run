# == Schema Information
#
# Table name: events_weapons
#
#  id         :bigint(8)        not null, primary key
#  event_id   :integer
#  weapon_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventsWeapon < ApplicationRecord
  belongs_to :event
  belongs_to :weapon
end
