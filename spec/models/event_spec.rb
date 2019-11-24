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

require 'rails_helper'

describe Event, type: :model, elasticsearch: true do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe 'scope by_weapon' do
    it 'weapon_id指定でイベントを参照できる' do
      expect(described_class.by_weapon(weapon)).to include event
    end
  end

  describe 'scope by_stage_id' do
    it 'weapon_id指定でイベントを参照できる' do
      expect(described_class.by_stage_id(stage.id)).to include event
    end
  end

  describe 'scope opening' do
    it '時間内にイベントがあるときは引っかかる' do
      event
      expect(described_class.opening).to include event
    end

    it '時間内にイベントがないときは引っかからない' do
      event.update(start_at: Time.zone.now - 10.days, end_at: Time.zone.now - 9.days)
      expect(described_class.opening).not_to include event
    end
  end
end
