require 'rails_helper'

describe 'Api::Stage', type: :request do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:stage) { event.stage }

  describe 'api_stage#index' do
    it 'returns http success' do
      get api_stages_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'api_stage#show' do
    let(:params) { { id: stage.id } }

    it 'returns http success' do
      get api_stage_path params
      expect(response).to have_http_status(:success)
    end

    it 'to show stage name' do
      get api_stage_path params
      expect(response.body).to include(stage.name)
    end
  end
end
