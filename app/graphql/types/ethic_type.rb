module Types
  class EthicType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :icon, String, null: false
    field :value, Integer, null: false
    field :effects, String, null: true
    field :description, String, null: true
    field :category, String, null: true
    field :effects_array, [String], null: true

    def effects_array
      object.effects.split("\n")
    end
  end
end
