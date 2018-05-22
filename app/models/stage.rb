# == Schema Information
#
# Table name: stages
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stage < ApplicationRecord
  has_many :events

  validates :name, presence: true
end
