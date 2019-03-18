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
  accepts_nested_attributes_for :events_weapons

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :stage_id, presence: true

  scope :by_stage_id, ->(stage_id) { where(stage_id: stage_id) if stage_id.present? }
  scope :by_weapon, ->(weapon) { joins(:events_weapons).where(events_weapons: { weapon_id: weapon.id }) if weapon.present? }
  scope :opening, ->(time = Time.zone.now) { where('start_at <= ?', time).where('end_at >= ?', time) }

  def hours
    (end_at - start_at).seconds_to_hours
  end
end
