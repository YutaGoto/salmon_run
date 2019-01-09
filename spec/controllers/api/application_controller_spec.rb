require 'rails_helper'

describe Api::ApplicationController, type: :controller do
  describe 'rescue_from' do
    context 'when to happen MaintenanceException' do
      controller do
        def index
          raise MaintenanceException, 'MaintenanceException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:service_unavailable) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('MaintenanceException') }
    end

    context 'when to happen ApplicationException' do
      controller do
        def index
          raise ApplicationException, 'ApplicationException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:internal_server_error) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('ApplicationException') }
    end

    context 'when to happen GoneException' do
      controller do
        def index
          raise GoneException, 'GoneException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:gone) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('GoneException') }
    end

    context 'when to happen ConflictException' do
      controller do
        def index
          raise ConflictException, 'ConflictException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:conflict) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('ConflictException') }
    end

    context 'when to happen NotFoundException' do
      controller do
        def index
          raise NotFoundException, 'NotFoundException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:not_found) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('NotFoundException') }
    end

    context 'when to happen AuthorityException' do
      controller do
        def index
          raise AuthorityException, 'AuthorityException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:unauthorized) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('AuthorityException') }
    end

    context 'when to happen InputErrorException' do
      controller do
        def index
          raise InputErrorException, 'InputErrorException'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:bad_request) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('InputErrorException') }
    end

    context 'when to happen Exception' do
      controller do
        def index
          raise Exception, 'Exception'
        end
      end
      before do
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:internal_server_error) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('Exception') }
    end
  end
end
