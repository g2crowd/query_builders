module Queries
  module Characters
    class CharacterSpellsQuery < Queries::Base
      option :filters, type: ::Types::Hash.constructor { |v| v.to_h }, default: proc { {} }
      option :limit, type: ::Types::Integer, default: proc { 1000 }

      def apply
        builder
          .add(QueryBuilder::Nodes::Joins::InnerJoin.new(initial_state, :spells))
          .add(wheres_operator(:and, *and_filters))
          .add(QueryBuilder::Nodes::Limit.new(limit))
      end

      private

      def initial_state
        ::Character
      end

      def and_filters
        [
          QueryBuilder::Characters::Nodes::IdIn.new(filters[:ids]),
          QueryBuilder::Spells::Nodes::LevelIn.new(spell_filters[:levels])
        ]
      end

      def spell_filters
        filters[:spells] || {}
      end
    end
  end
end
