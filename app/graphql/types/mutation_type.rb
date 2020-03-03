module Types
  class MutationType < Types::BaseObject
    field :create_empire, mutation: Mutations::CreateEmpire
    field :create_species, mutation: Mutations::CreateSpecies
    field :create_homeworld, mutation: Mutations::CreateHomeworld
  end
end
