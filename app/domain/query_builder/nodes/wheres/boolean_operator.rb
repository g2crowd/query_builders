module QueryBuilder
  module Nodes
    module Wheres
      module BooleanOperator
        class Builder < QueryBuilder::Builders::Wheres
          option :operator

          private

          def visit(state, node)
            state.send(operator, node.clause)
          end
        end

        def valid?
          @builder.valid?
        end

        def clause
          @builder.build
        end
      end
    end
  end
end
