# typed: false
require 'rails_helper'

describe 'Events', type: :request do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }

  describe 'events#index' do
    it 'returns http success' do
      get events_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'events#show' do
    let(:params) { { id: event.id } }

    it 'returns http success' do
      get event_path params
      expect(response).to have_http_status(:success)
    end
  end
end
