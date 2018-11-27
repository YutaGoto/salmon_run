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

    it 'include stages' do
      get api_stages_path
      expect(assigns(:stages)).to include stage
    end
  end

  describe 'api_stage#show' do
    let(:params) { { id: stage.id } }
    it 'returns http success' do
      get api_stage_path params
      expect(response).to have_http_status(:success)
    end

    it 'assign stage' do
      get api_stage_path params
      expect(assigns(:stage)).to eq stage
    end
  end
end
