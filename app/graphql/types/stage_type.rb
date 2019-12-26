# typed: strict
module Types
  class StageType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :image_url, String, null: false
  end
end
