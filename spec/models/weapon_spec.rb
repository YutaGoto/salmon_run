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
end
