class Mutations::CreateEmpire < Mutations::BaseMutation
  argument :name, String, required: true

  field :empire, Types::EmpireType, null: false
  field :errors, [String], null: false

  def resolve(name:)
    empire = Empire.new(name: name)
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
