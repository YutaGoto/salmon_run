module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :start_at, Types::DateTimeType, null: false
    field :end_at, Types::DateTimeType, null: false
    field :hours, Float, null: false
    field :stage, Types::StageType, null: false
    field :events_weapons, [EventsWeaponType], null: true
  end
end
