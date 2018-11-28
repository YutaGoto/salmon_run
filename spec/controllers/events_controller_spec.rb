require 'rails_helper'

describe EventsController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe 'events#index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'events#show' do
    let(:params) { { id: event.id } }
    it 'returns http success' do
      get :index, params: params
      expect(response).to have_http_status(:success)
    end
  end
end
