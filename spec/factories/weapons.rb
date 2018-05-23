# == Schema Information
#
# Table name: weapons
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :weapon do
    name { 'フライパン' }
  end
end
