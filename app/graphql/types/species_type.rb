module Types
  class SpeciesType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :portrait, String, null: false
    field :biography, String, null: true
    field :archetype, String, null: false
    # field :homeworlds, [Types::HomeworldType], null: true
    # field :origins, [Types::OriginType], null: true
    # field :traits, [Types::TraitType], null: true
  end
end
