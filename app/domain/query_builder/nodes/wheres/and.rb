module QueryBuilder
  module Nodes
    module Wheres
      class And < QueryBuilder::Nodes::Wheres::Base
        include QueryBuilder::Nodes::Wheres::BooleanOperator

        # rubocop:disable Lint/MissingSuper
        def initialize(*child_nodes)
          @builder = Builder.new(operator: :and).add(*child_nodes)
        end
        # rubocop:enable Lint/MissingSuper
      end
    end
  end
end
