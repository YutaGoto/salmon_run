# typed: strict
module Types
  class EventsWeaponType < Types::BaseObject
    field :event, Types::EventType, null: false
    field :weapon, Types::WeaponType, null: false
    field :since_last_event_times, Integer, null: true
  end
end
