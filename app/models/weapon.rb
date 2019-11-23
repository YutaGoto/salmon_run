# == Schema Information
#
# Table name: weapons
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Weapon < ApplicationRecord
  has_many :events_weapons
  has_many :events, through: :events_weapons

  validates :name, presence: true

  def count_text
    events_weapons.count
  end

  def last_weapon_event
    events_weapons.joins(:event).where('events.start_at <= ?', Time.zone.now).last(2).first
  end

  def self.weapon_search(word)
    return [] if word.nil?
    Weapon.where('name like ?', "%#{word}%")
  end
end
