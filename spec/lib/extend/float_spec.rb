require 'rails_helper'

describe Float do
  it 'converting from seconds to hours' do
    expect(7200.0.seconds_to_hours).to eq 2
  end

  it 'converting from seconds to hours real float' do
    expect(5400.0.seconds_to_hours).to eq 1.5
  end
end
