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

require 'rails_helper'

RSpec.describe EventsWeapon, type: :model do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe '#since_last_event_times' do
    it '何回目かを見れる' do
      event
      expect(events_weapon.since_last_event_times).to eq(-1)
    end
  end
end
