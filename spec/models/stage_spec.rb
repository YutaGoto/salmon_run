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

require 'rails_helper'

describe Stage, type: :model do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe '#weapon_count' do
    it 'ステージに紐づくブキの回数が取得できる' do
      expect(stage.weapon_count(weapon.id)).to eq 1
    end

    it '存在しないブキIDの場合は0が返る' do
      expect(stage.weapon_count(0)).to eq 0
    end
  end
end
