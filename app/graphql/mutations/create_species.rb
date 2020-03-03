class Mutations::CreateSpecies < Mutations::BaseMutation
  argument :name, String, required: true
  argument :portrait, String, required: true
  argument :biography, String, required: false
  argument :archetype, String, required: true
  argument :origin_id, ID, required: true

  field :species, Types::SpeciesType, null: false
  field :errors, [String], null: false

  def resolve(name:, portrait:, biography:, archetype:, origin_id:)
    species = Species.new(name: name, portrait: portrait, biography: biography,
                          archetype: archetype, origin_id: origin_id)
    if species.save
      {
        species: species,
        errors: []
      }
    else
      {
        species: nil,
        errors: species.errors.full_messages
      }
    end
  end
end
