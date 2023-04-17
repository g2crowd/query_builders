module QueryBuilder
  module Nodes
    module Wheres
      class Or < QueryBuilder::Nodes::Wheres::Base
        include QueryBuilder::Nodes::Wheres::BooleanOperator

        def initialize(*child_nodes)
          @builder = Builder.new(operator: :or).add(*child_nodes)
          super
        end
      end
    end
  end
end
