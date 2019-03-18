require 'rails_helper'

describe 'event query', type: :request do
  let!(:events_weapon) { FactoryBot.create :events_weapon }
  let!(:event) { events_weapon.event }
  let!(:weapon) { events_weapon.weapon }
  let!(:stage) { event.stage }

  let(:query) do
    <<~QUERY
      {
        events{
          id
          startAt
          endAt
          hours
          stage {
            name
          }
          eventsWeapons {
            weapon{
              name
              imageUrl
            }
          }
        }
      }
    QUERY
  end

  context 'response body id event data' do
    it 'to get event id' do
      post graphql_path, params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:events][0][:id]).to eq event.id.to_s
    end

    it 'to get stage name' do
      post graphql_path, params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:events][0][:stage][:name]).to eq stage.name
    end

    it 'to get weapon name' do
      post graphql_path, params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:events][0][:eventsWeapons][0][:weapon][:name]).to eq weapon.name
    end
  end
end
