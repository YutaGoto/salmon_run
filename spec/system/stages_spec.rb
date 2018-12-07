require 'rails_helper'

feature 'Stages', type: :system do
  background do
    events_weapon = FactoryBot.create :events_weapon
    @event = events_weapon.event
  end
  context 'index' do
    scenario 'To Show Events informations' do
      visit events_path
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン開催履歴'
    end
  end

  context 'show' do
    scenario 'To Show Event informations' do
      visit event_path(@event)
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン 詳細'
    end
  end
end
