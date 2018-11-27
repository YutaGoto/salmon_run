require 'rails_helper'

describe 'Api::Weapon', type: :request do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }

  describe 'api_weapon#index' do
    it 'returns http success' do
      get api_weapons_path
      expect(response).to have_http_status(:success)
    end

    it 'include weapons' do
      get api_weapons_path
      expect(assigns(:weapons)).to include weapon
    end
  end
end
