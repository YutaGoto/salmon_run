module Types
  class QueryType < Types::BaseObject
    field :event, EventType, null: true do
      description 'Find a event by ID'
      argument :id, ID, required: true
    end

    field :events, [EventType], null: true do
      description 'get all events'
      argument :weaponName, String, required: false
    end

    def event(id)
      Event.find(id)
    end

    def events(weapon_name: nil)
      if weapon_name.nil?
        Event.all
      else
        event_search(weapon_name)
      end
    end

    private

    def event_search(weapon_name)
      weapon = Weapon.weapon_search(weapon_name).first
      Event.by_weapon(weapon)
    end
  end
end
