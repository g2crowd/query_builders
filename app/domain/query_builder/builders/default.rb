module QueryBuilder
  module Builders
    class Default < ::QueryBuilder::Builders::Base
      option :initial_state

      private

      def reduce(&block)
        nodes.select(&:valid?).reduce(initial_state, &block)
      end

      def base_node_class
        ::QueryBuilder::Nodes::Base
      end

      def visit(state, node)
        node.accept(state)
      end
    end
  end
end
