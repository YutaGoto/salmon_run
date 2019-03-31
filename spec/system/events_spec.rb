require 'rails_helper'

describe 'Events', type: :system, elasticsearch: true do
  context 'with index action' do
    before :all do
      Weapon.__elasticsearch__.create_index! force: true
      Weapon.__elasticsearch__.import
    end

    it 'To Show Events informations' do
      visit events_path
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン開催履歴'
    end

    it 'To Show stage information' do
      events_weapon = FactoryBot.create :events_weapon
      stage = events_weapon.event.stage

      visit events_path
      expect(page).to have_content stage.name
    end

    it 'To Show weapon information' do
      events_weapon = FactoryBot.create :events_weapon
      weapon = events_weapon.weapon

      visit events_path
      expect(page).to have_content weapon.name
    end
  end

  context 'with show action' do
    it 'To Show Event informations' do
      events_weapon = FactoryBot.create :events_weapon
      event = events_weapon.event
      visit event_path(event)
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン 詳細'
    end
  end
end
