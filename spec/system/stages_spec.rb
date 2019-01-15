require 'rails_helper'

describe 'Stages', type: :system do
  context 'with index action' do
    it 'To Show Events informations' do
      visit events_path
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン開催履歴'
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
