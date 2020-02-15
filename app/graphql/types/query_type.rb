module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :traits, [Types::TraitType], null: false

    def traits
      Trait.all
    end

    field :trait, Types::TraitType, null: false do
      argument :id, ID, required: true
    end

    def trait(id:)
      Trait.find(id)
    end

    field :traits_by_group, [Types::TraitType], null: false do
      argument :group, String, required: true
    end

    def traits_by_group(group:)
      Trait.where(group: group)
    end

    field :civics, [Types::CivicType], null: false

    def civics
      Civic.all
    end

    field :civic, Types::CivicType, null: false do
      argument :id, ID, required: true
    end

    def civic(id:)
      Civic.find(id)
    end

    field :civics_by_group, [Types::CivicType], null: false do
      argument :group, String, required: true
    end

    def civics_by_group(group:)
      Civic.where(group: group)
    end
  end
end
