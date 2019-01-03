require 'rails_helper'

describe Api::ApplicationController, type: :controller do
  describe 'rescue_from' do
    context 'MaintenanceException' do
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
      it { expect(response).to have_http_status(503) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('MaintenanceException') }
    end

    context 'ApplicationException' do
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
      it { expect(response).to have_http_status(500) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('ApplicationException') }
    end

    context 'GoneException' do
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
      it { expect(response).to have_http_status(410) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('GoneException') }
    end

    context 'ConflictException' do
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
      it { expect(response).to have_http_status(409) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('ConflictException') }
    end

    context 'NotFoundException' do
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
      it { expect(response).to have_http_status(404) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('NotFoundException') }
    end

    context 'AuthorityException' do
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
      it { expect(response).to have_http_status(401) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('AuthorityException') }
    end

    context 'InputErrorException' do
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
      it { expect(response).to have_http_status(400) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('InputErrorException') }
    end

    context 'Exception' do
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
      it { expect(response).to have_http_status(500) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:message]).to eq('Exception') }
    end
  end
end
