# == Schema Information
#
# Table name: weapons
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Weapon < ApplicationRecord
  has_many :events_weapons
  has_many :events, through: :events_weapons

  validates :name, presence: true
end
