module Queries
  module Campaigns
    class IndexQuery < Queries::Base

      option :filters, type: ::Types::Hash.constructor { |v| v.to_h }, default: proc { {} }
      option :limit, type: ::Types::Integer, default: proc { 50 }
      option :order_by, type: ::Types::String, default: proc { 'id ASC' }

      def apply
        apply_joins
        builder
          .add(QueryBuilder::Nodes::SelectDistinct.new(initial_state, %i(id title)))
          .add(wheres_operator(:and, *and_filters))
          .add(QueryBuilder::Nodes::OrderBy.new(order_by))
          .add(QueryBuilder::Nodes::Limit.new(limit))
      end

      def initial_state
        ::Campaign
      end

      private

      def and_filters
        [
          QueryBuilder::Campaigns::Nodes::TitleIn.new(filters[:titles]),
          QueryBuilder::Campaigns::Nodes::TimeWindow.new(**time_window),
          QueryBuilder::Characters::Nodes::Legendary.new(characters_filters[:legendary])
        ]
      end

      def characters_filters
        filters[:characters] || {}
      end

      def time_window
        { start_date_lteq: filters[:start_date_lteq], start_date_gteq: filters[:start_date_gteq] }
      end
    end
  end
end
