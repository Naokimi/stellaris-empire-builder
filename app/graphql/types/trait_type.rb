module Types
  class TraitType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :icon, String, null: false
    field :value, Integer, null: false
    field :effects, String, null: true
    field :description, String, null: true
    field :category, String, null: true
    field :type, String, null: false
    # field :species, [Types::SpeciesType], null: true
  end
end
