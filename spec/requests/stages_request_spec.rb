require 'rails_helper'

describe Stage, type: :request do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe 'stage#show' do
    let(:params) { { id: stage.id } }
    it 'returns http success' do
      get stage_path params
      expect(response).to have_http_status(:success)
    end
  end
end
