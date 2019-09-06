require 'rails_helper'

describe ApplicationController, type: :controller do
  describe 'rescue_from' do
    context 'when to happen MaintenanceException' do
      controller(described_class) do
        def index
          raise MaintenanceException, 'MaintenanceException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:service_unavailable) }
    end

    context 'when to happen ApplicationException' do
      controller(described_class) do
        def index
          raise ApplicationException, 'ApplicationException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:internal_server_error) }
    end

    context 'when to happen GoneException' do
      controller(described_class) do
        def index
          raise GoneException, 'GoneException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:gone) }
    end

    context 'when to happen NotFoundException' do
      controller(described_class) do
        def index
          raise NotFoundException, 'NotFoundException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:not_found) }
    end

    context 'when to happen AuthorityException' do
      controller(described_class) do
        def index
          raise AuthorityException, 'AuthorityException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:unauthorized) }
    end

    context 'when to happen InputErrorException' do
      controller(described_class) do
        def index
          raise InputErrorException, 'InputErrorException'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:bad_request) }
    end

    context 'when to happen Exception' do
      controller(described_class) do
        def index
          raise Exception, 'Exception'
        end
      end
      before { get :index }

      pending { expect(response.content_type).to eq('text/html') }
      pending { expect(response).to have_http_status(:internal_server_error) }
    end
  end
end
