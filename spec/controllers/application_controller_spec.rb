require 'rails_helper'

describe ApplicationController, type: :controller do
  describe 'rescue_from' do
    context 'MaintenanceException' do
      controller do
        def index
          raise MaintenanceException, 'MaintenanceException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(503) }
    end

    context 'ApplicationException' do
      controller do
        def index
          raise ApplicationException, 'ApplicationException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(500) }
    end

    context 'GoneException' do
      controller do
        def index
          raise GoneException, 'GoneException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(410) }
    end

    context 'NotFoundException' do
      controller do
        def index
          raise NotFoundException, 'NotFoundException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(404) }
    end

    context 'AuthorityException' do
      controller do
        def index
          raise AuthorityException, 'AuthorityException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(401) }
    end

    context 'InputErrorException' do
      controller do
        def index
          raise InputErrorException, 'InputErrorException'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(400) }
    end

    context 'Exception' do
      controller do
        def index
          raise Exception, 'Exception'
        end
      end
      before { get :index }

      it { expect(response.content_type).to eq('text/html') }
      it { expect(response).to have_http_status(500) }
    end
  end
end
