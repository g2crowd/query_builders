module Queries
  module Characters
    class CharacterSpellsQuery < Queries::Base
      option :filters, type: ::Types::Hash.constructor { |v| v.to_h }, default: proc { {} }
      option :limit, type: ::Types::Integer, default: proc { 1000 }

      def apply
        builder
          .add(QueryBuilder::Clauses::Joins::InnerJoin.new(initial_state, :spells))
          .add(wheres_operator(:and, *and_filters))
          .add(QueryBuilder::Clauses::Limit.new(limit))
      end

      private

      def and_filters
        [
          QueryBuilder::Characters::Clauses::IdIn.new(filters[:ids]),
          QueryBuilder::Spells::Clauses::LevelIn.new(spell_filters[:levels])
        ]
      end

      def spell_filters
        filters[:spells] || {}
      end
    end
  end
end