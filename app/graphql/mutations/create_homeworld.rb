class Mutations::CreateHomeworld < Mutations::BaseMutation
  argument :name, String, required: true
  argument :kind, String, required: true
  argument :species, Types::SpeciesType, required: true

  field :homeworld, Types::HomeworldType, null: false
  field :errors, [String], null: false

  def resolve(name:, species:, kind:)
    homeworld = homeworld.new(name: name, kind: kind)
    homeworld.species = species
    if homeworld.save
      {
        homeworld: homeworld,
        errors: []
      }
    else
      {
        homeworld: nil,
        errors: homeworld.errors.full_messages
      }
    end
  end
end
