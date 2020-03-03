class Mutations::CreateEmpire < Mutations::BaseMutation
  argument :name, String, required: true
  argument :species_id, ID, required: true
  argument :government_id, ID, required: true

  field :empire, Types::EmpireType, null: false
  field :errors, [String], null: false

  def resolve(name:, species_id:, government_id:)
    empire = Empire.new(name: name, species_id: species_id, government_id: government_id)
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
