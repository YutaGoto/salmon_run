# == Schema Information
#
# Table name: stages
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stage < ApplicationRecord
  has_many :events

  validates :name, presence: true

  def weapon_count(weapon_id)
    events.joins(:events_weapons).where(events_weapons: { weapon_id: weapon_id }).size
  end
end
