require 'rails_helper'

RSpec.describe Api::EventsController, type: :controller do
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

    it 'include event' do
      get :index
      expect(assigns(:events)).to include event
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

  describe 'GET #open' do
    it 'assign opening_event if opening' do
      event.update(start_at: Time.zone.now - 1.hour, end_at: Time.zone.now + 1.hour)
      get :open
      expect(assigns(:opening_event)).to eq event
    end

    it 'assign is_open is true if opening' do
      event.update(start_at: Time.zone.now - 1.hour, end_at: Time.zone.now + 1.hour)
      get :open
      expect(assigns(:is_open)).to eq true
    end

    it 'unassign opening_event if not opening' do
      event.update(start_at: Time.zone.now - 10.days, end_at: Time.zone.now - 9.days)
      get :open
      expect(assigns(:opening_event)).not_to eq event
    end

    it 'assign is_open is false if not opening' do
      event.update(start_at: Time.zone.now - 10.days, end_at: Time.zone.now - 9.days)
      get :open
      expect(assigns(:is_open)).to eq false
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end
end
