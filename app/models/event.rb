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

  scope :by_stage_id, ->(stage_id) { where(stage_id: stage_id) if stage_id }
  scope :by_weapon_id, ->(weapon_id) { joins(:events_weapons).where(events_weapons: { weapon_id: weapon_id }) if weapon_id }
  scope :opening, ->(time = Time.zone.now) { where('start_at <= ?', time).where('end_at >= ?', time) }
end
