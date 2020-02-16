module Types
  class OriginType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :image, String, null: false
    field :effects, String, null: true
    field :description, String, null: true
    # field :species, [Types::SpeciesType], null: true
  end
end
