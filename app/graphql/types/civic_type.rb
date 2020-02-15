module Types
  class CivicType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :icon, String, null: false
    field :effects, String, null: true
    field :description, String, null: true
    field :group, String, null: false
    field :effects_array, [String], null: true

    def effects_array
      object.effects.split("\n")
    end
  end
end
