class Mutations::CreateEmpire < Mutations::BaseMutation
  argument :name, String, required: true
  argument :species, Types::SpeciesType, required: true
  argument :government, Types::GovernmentType, required: true

  field :empire, Types::EmpireType, null: false
  field :errors, [String], null: false

  def resolve(name:, species:, government:)
    empire = Empire.new(name: name)
    empire.species = species
    empire.government = government
    if empire.save
      {
        empire: empire,
        errors: []
      }
    else
      {
        empire: nil,
        errors: empire.errors.full_messages
      }
    end
  end
end
