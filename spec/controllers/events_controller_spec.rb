require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:events_weapon) { FactoryBot.create :events_weapon }
  let(:event) { events_weapon.event }
  let(:weapon) { events_weapon.weapon }
  let(:stage) { event.stage }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'include event' do
      get :index
      expect(assigns(:events)).to include event
    end

    it 'assign opening if opening' do
      event.update(start_at: Time.zone.now - 1.hour, end_at: Time.zone.now + 1.hour)
      get :index
      expect(assigns(:opening_event)).to eq event
    end

    it 'unassign opening if not opening' do
      event.update(start_at: Time.zone.now - 10.days, end_at: Time.zone.now - 9.days)
      get :index
      expect(assigns(:opening_event)).not_to eq event
    end
  end
end
