class Mutations::CreateHomeworld < Mutations::BaseMutation
  argument :name, String, required: true
  argument :kind, String, required: true
  argument :species_id, ID, required: true

  field :homeworld, Types::HomeworldType, null: false
  field :errors, [String], null: false

  def resolve(name:, species_id:, kind:)
    homeworld = Homeworld.new(name: name, kind: kind, species_id: species_id)
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
