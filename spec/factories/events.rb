# typed: false
# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  stage_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :event do
    start_at { Time.zone.now }
    end_at { Time.zone.now + 30.hours }
    stage
  end
end
