require 'rails_helper'

RSpec.describe Api::StagesController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:stage) { event.stage }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'include stages' do
      get :index
      expect(assigns(:stages)).to include stage
    end
  end
end
