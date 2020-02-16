module Types
  class GovernmentType < Types::BaseObject
    field :id, ID, null: false
    field :authority, String, null: false
    field :icon, String, null: false
    field :description, String, null: true
  end
end
