# == Schema Information
#
# Table name: events_weapons
#
#  id         :bigint           not null, primary key
#  event_id   :integer
#  weapon_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :events_weapon do
    event
    weapon
  end
end
