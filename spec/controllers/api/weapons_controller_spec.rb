require 'rails_helper'

RSpec.describe Api::WeaponsController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'include weapons' do
      get :index
      expect(assigns(:weapons)).to include weapon
    end
  end
end
