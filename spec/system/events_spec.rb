require 'rails_helper'

feature 'Events', type: :system do
  background do
    events_weapon = FactoryBot.create :events_weapon
    event = events_weapon.event
    @stage = event.stage
  end
  context 'show' do
    scenario 'To Show stage informations' do
      visit stage_path(@stage)
      expect(page).to have_content @stage.name
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン'
    end
  end
end
