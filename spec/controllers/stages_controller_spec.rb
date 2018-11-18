require 'rails_helper'

RSpec.describe StagesController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end
end
