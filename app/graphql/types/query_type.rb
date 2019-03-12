module Types
  class QueryType < Types::BaseObject
    field :event, EventType, null: true do
      description 'Find a post by ID'
      argument :id, ID, required: true
    end

    def event(id:)
      Event.find(id)
    end
  end
end
