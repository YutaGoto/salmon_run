module Types
  class QueryType < Types::BaseObject
    field :events, [EventType], null: true do
      description 'get events'
      argument :weaponName, String, required: false
      argument :stageId, Integer, required: false
    end

    field :opening, EventType, null: true do
      description 'get opening events'
    end

    def events(weapon_name: nil, stage_id: nil)
      event_search(weapon_name, stage_id)
    end

    def opening
      Event.opening.last
    end

    private

    def event_search(weapon_name, stage_id)
      weapon = Weapon.weapon_search(weapon_name).first
      Event.by_weapon(weapon).by_stage_id(stage_id).includes(:stage, events_weapons: [:weapon])
    end
  end
end
