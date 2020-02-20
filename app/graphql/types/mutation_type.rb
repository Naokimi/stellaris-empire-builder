module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_empire, mutation: Mutations::CreateEmpire
    field :create_species, mutation: Mutations::CreateSpecies
    field :create_homeworld, mutation: Mutations::CreateHomeworld
  end
end
