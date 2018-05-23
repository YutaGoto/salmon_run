# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  stage_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :stage
  has_many :events_weapons
  has_many :weapons, through: :events_weapons

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :stage_id, presence: true

  scope :by_weapon_ids, ->(weapon_ids) {
    joins(:events_weapons).where(events_weapons: { weapon_id: weapon_ids })
  }
end
