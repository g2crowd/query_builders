module QueryBuilder
  module Characters
    module Nodes
      class Legendary < QueryBuilder::Nodes::Wheres::Base
        include Queries::Helpers::Wheres

        attr_reader :builder, :legendary

        # rubocop:disable Lint/MissingSuper
        def initialize(legendary)
          @legendary = legendary
          @builder = QueryBuilder::Builders::Wheres.new
        end
        # rubocop:enable Lint/MissingSuper

        def clause
          builder.add(wheres_operator(:and, *and_filters))
          builder.build
        end

        def and_filters
          [
            QueryBuilder::Characters::Nodes::Veteran.new,
            QueryBuilder::Characters::Nodes::Buff.new
          ]
        end

        def valid?
          legendary.present?
        end
      end
    end
  end
end
