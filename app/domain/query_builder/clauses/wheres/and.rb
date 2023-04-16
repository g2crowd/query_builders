module QueryBuilder
  module Clauses
    module Wheres
      class And < QueryBuilder::Clauses::Wheres::Base
        include QueryBuilder::Clauses::Wheres::BooleanOperator

        # rubocop:disable Lint/MissingSuper
        def initialize(*child_nodes)
          @builder = Builder.new(operator: :and).add(*child_nodes)
        end
        # rubocop:enable Lint/MissingSuper
      end
    end
  end
end
