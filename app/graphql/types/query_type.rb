module Types
  class QueryType < Types::BaseObject
    field :event, EventType, null: true do
      description 'Find a post by ID'
      argument :id, ID, required: true
    end

    field :events, [EventType], null: true do
      description 'get all events'
    end

    def event(id:)
      Event.find(id)
    end

    def events
      Event.all
    end
  end
end
