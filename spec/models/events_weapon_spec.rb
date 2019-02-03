# == Schema Information
#
# Table name: events_weapons
#
#  id         :bigint(8)        not null, primary key
#  event_id   :integer
#  weapon_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe EventsWeapon, type: :model do
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
