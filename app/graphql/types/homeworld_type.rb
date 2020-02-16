module Types
  class HomeworldType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :kind, String, null: false
    # field :species, [Types::SpeciesType], null: true
  end
end
