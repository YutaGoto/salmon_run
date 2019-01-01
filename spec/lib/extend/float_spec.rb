require 'rails_helper'

describe 'Float' do
  it 'converting from seconds to hours' do
    expect(3600.0.seconds_to_hours).to eq 1
    expect(7200.0.seconds_to_hours).to eq 2
    expect(5400.0.seconds_to_hours).to eq 1.5
  end
end
