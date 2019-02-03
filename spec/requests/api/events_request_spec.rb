require 'rails_helper'

describe 'Api::Event', type: :request, elasticsearch: true do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }
  let(:other_stage) { FactoryBot.create :stage }
  let(:other_weapon) { FactoryBot.create_list :weapon, 3 }

  before :all do
    Weapon.create_index!
    Weapon.import
  end

  describe 'api_event#index' do
    it 'returns http success' do
      get api_events_path
      expect(response).to have_http_status(:success)
    end

    context 'when params have [:stages]' do
      it 'returns http success' do
        params = { stages: stage.id }
        get api_events_path params
        expect(response).to have_http_status(:success)
      end

      it 'include event if same stage' do
        params = { stages: stage.id }
        get api_events_path params
        expect(response.body).to include(stage.name)
      end
    end

    context 'when params have [:weapons]' do
      it 'returns http success' do
        params = { weapons: weapon.id }
        get api_events_path params
        expect(response).to have_http_status(:success)
      end

      it 'include event if same weapon' do
        params = { weapons: weapon.id }
        get api_events_path params
        expect(response.body).to include(weapon.name)
      end
    end
  end

  describe 'GET #open' do
    it 'include event if same weapon' do
      get open_api_events_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      params = { id: event.id }
      get api_event_path params
      expect(response).to have_http_status(:success)
    end

    it 'to show stage name' do
      params = { id: event.id }
      get api_event_path params
      expect(response.body).to include(stage.name)
    end
  end
end
