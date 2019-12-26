require 'rails_helper'

describe 'Stages', type: :system do
  context 'with show action' do
    it 'To show h1 content' do
      events_weapon = FactoryBot.create :events_weapon
      stage = events_weapon.event.stage

      visit stage_path(stage)
      expect(page).to have_content 'すぷらとぅーん2 サーモンラン'
    end

    it 'To Show stage informations' do
      events_weapon = FactoryBot.create :events_weapon
      stage = events_weapon.event.stage
      visit stage_path(stage)
      expect(page).to have_content stage.name
    end
  end
end
