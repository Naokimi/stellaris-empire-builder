class Mutations::CreateSpecies < Mutations::BaseMutation
  argument :name, String, required: true
  argument :portrait, String, required: true
  argument :biography, String, required: false
  argument :archetype, String, required: true
  argument :origin, Types::OriginType, required: true

  field :species, Types::SpeciesType, null: false
  field :errors, [String], null: false

  def resolve(name:, portrait:, biography:, archetype:, origin:)
    species = Species.new(name: name, portrait: portrait, biography: biography, archetype: archetype)
    species.origin = origin
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
