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

require 'rails_helper'

RSpec.describe Weapon, type: :model do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe '#count_text' do
    it 'ひとつある' do
      expect(weapon.count_text).to eq 1
    end
  end

  describe '#last_weapon_event' do
    it '前回のイベントと一致する' do
      expect(weapon.last_weapon_event).to eq events_weapon
    end
  end
end
