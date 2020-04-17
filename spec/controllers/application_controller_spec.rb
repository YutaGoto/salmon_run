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

      it { expect(response).to render_template('common/errors/503') }
    end

    context 'when to happen ApplicationException' do
      controller(described_class) do
        def index
          raise ApplicationException, 'ApplicationException'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/500') }
    end

    context 'when to happen GoneException' do
      controller(described_class) do
        def index
          raise GoneException, 'GoneException'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/410') }
    end

    context 'when to happen NotFoundException' do
      controller(described_class) do
        def index
          raise NotFoundException, 'NotFoundException'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/404') }
    end

    context 'when to happen AuthorityException' do
      controller(described_class) do
        def index
          raise AuthorityException, 'AuthorityException'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/401') }
    end

    context 'when to happen InputErrorException' do
      controller(described_class) do
        def index
          raise InputErrorException, 'InputErrorException'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/400') }
    end

    context 'when to happen Exception' do
      controller(described_class) do
        def index
          raise Exception, 'Exception'
        end
      end
      before { get :index }

      it { expect(response).to render_template('common/errors/500') }
    end
  end
end
