module Types
  class EmpireType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    # field :species, [Types::SpeciesType], null: true
    # field :government, [Types::GovernmentType], null: true
  end
end
