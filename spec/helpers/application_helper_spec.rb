require 'rails_helper'

describe ApplicationHelper do
  describe 'l' do
    context 'when normal' do
      it 'to return datetime default format if format is none' do
        expect(helper.l(Time.zone.now)).to eq Time.zone.now.strftime('%Y/%m/%d %H:%M:%S')
      end

      it 'to return datetime short format if format is short' do
        expect(helper.l(Time.zone.now, format: :short)).to eq Time.zone.now.strftime('%Y/%m/%d %H:%M')
      end
    end

    context 'when abnormal' do
      it 'to return blank if to send string' do
        expect(helper.l('hello')).to eq ''
      end

      it 'to return blank if to send number' do
        expect(helper.l(111)).to eq ''
      end

      it 'to return blank if to send nil' do
        expect(helper.l).to eq ''
      end
    end
  end
end
