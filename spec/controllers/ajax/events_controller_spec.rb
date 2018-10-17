require 'rails_helper'

RSpec.describe Ajax::EventsController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }
  let(:other_stage) { FactoryBot.create :stage }
  let(:other_weapon) { FactoryBot.create :weapon }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'no params' do
      it 'include event' do
        get :index
        expect(assigns(:events)).to include event
      end
    end

    context 'params[:stages]' do
      it 'include event if same stage' do
        get :index, params: { stages: stage.id }
        expect(assigns(:events)).to include event
      end

      it 'exclude event if defference stage' do
        get :index, params: { stages: other_stage.id }
        expect(assigns(:events)).not_to include event
      end
    end

    context 'params[:weapons]' do
      it 'include event if same weapon' do
        get :index, params: { weapons: weapon.id }
        expect(assigns(:events)).to include event
      end

      it 'exclude event if defference weapon' do
        get :index, params: { weapons: other_weapon.id }
        expect(assigns(:events)).not_to include event
      end
    end
  end
end
