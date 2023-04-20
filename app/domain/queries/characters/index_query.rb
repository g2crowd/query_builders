module Queries
  module Characters
    class IndexQuery < Queries::Base
      option :limit, type: ::Types::Integer, default: proc { 50 }
      option :order_by, type: ::Types::String, default: proc { 'name ASC' }

      private

      def apply
        apply_joins
        builder
          .add(wheres_operator(:and, *and_filters))
          .add(QueryBuilder::Nodes::OrderBy.new(order_by))
          .add(QueryBuilder::Nodes::Limit.new(limit))
      end

      def initial_state
        ::Character
      end

      def and_filters
        [
          QueryBuilder::Spells::Nodes::LevelIn.new(spells_filters[:levels]),
          QueryBuilder::Spells::Nodes::NameIn.new(spells_filters[:names]),
          QueryBuilder::Flaws::Nodes::TitleIn.new(flaws_filters[:titles]),
          QueryBuilder::Virtues::Nodes::TitleIn.new(virtues_filters[:titles]),
          QueryBuilder::Feats::Nodes::NameIn.new(feats_filters[:names]),
          QueryBuilder::Specializations::Nodes::NameIn.new(specializations_filters[:names]),
          QueryBuilder::Characters::Nodes::Legendary.new(filters[:legendary])
        ]
      end

      def spells_filters
        filters[:spells] || {}
      end

      def flaws_filters
        filters[:flaws] || {}
      end

      def virtues_filters
        filters[:virtues] || {}
      end

      def feats_filters
        filters[:feats] || {}
      end

      def specializations_filters
        filters[:specializations] || {}
      end
    end
  end
end
