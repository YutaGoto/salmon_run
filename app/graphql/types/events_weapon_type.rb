module Types
  class EventsWeaponType < Types::BaseObject
    field :event, Types::EventType, null: false
    field :weapon, Types::WeaponType, null: false
  end
end
