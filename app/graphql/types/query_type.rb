module Types
  class QueryType < Types::BaseObject
    # Civics
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

    # Empires
    field :empires, [Types::EmpireType], null: false

    def empires
      Empire.all
    end

    field :empire, Types::EmpireType, null: false do
      argument :id, ID, required: true
    end

    def empire(id:)
      Empire.find(id)
    end

    # Ethics
    field :ethics, [Types::EthicType], null: false

    def ethics
      Ethic.all
    end

    field :ethic, Types::EthicType, null: false do
      argument :id, ID, required: true
    end

    def ethic(id:)
      Ethic.find(id)
    end

    field :ethics_by_group, [Types::EthicType], null: false do
      argument :group, String, required: true
    end

    def ethics_by_group(group:)
      Ethic.where(group: group)
    end

    # Governments
    field :governments, [Types::GovernmentType], null: false

    def governments
      Government.all
    end

    field :government, Types::GovernmentType, null: false do
      argument :id, ID, required: true
    end

    def government(id:)
      Government.find(id)
    end

    # Homeworlds
    field :homeworlds, [Types::HomeworldType], null: false

    def homeworlds
      Homeworld.all
    end

    field :homeworld, Types::HomeworldType, null: false do
      argument :id, ID, required: true
    end

    def homeworld(id:)
      Homeworld.find(id)
    end

    # Origins
    field :origins, [Types::OriginType], null: false

    def origins
      Origin.all
    end

    field :origin, Types::OriginType, null: false do
      argument :id, ID, required: true
    end

    def origin(id:)
      Origin.find(id)
    end

    # Traits
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
  end
end
