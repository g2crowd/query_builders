module QueryBuilder
  module Nodes
    module Wheres
      class And < QueryBuilder::Nodes::Wheres::Base
        include QueryBuilder::Nodes::Wheres::BooleanOperator

        def initialize(*child_nodes)
          @builder = Builder.new(operator: :and).add(*child_nodes)
        end
      end
    end
  end
end
