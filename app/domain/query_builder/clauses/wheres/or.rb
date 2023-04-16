module QueryBuilder
  module Clauses
    module Wheres
      class Or < QueryBuilder::Clauses::Wheres::Base
        include QueryBuilder::Clauses::Wheres::BooleanOperator

        def initialize(*child_nodes)
          @builder = Builder.new(operator: :or).add(*child_nodes)
          super
        end
      end
    end
  end
end
