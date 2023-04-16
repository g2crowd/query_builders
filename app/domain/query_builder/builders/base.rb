module QueryBuilder
  module Builders
    class Base
      extend Dry::Initializer

      option :nodes, type: ::Types::Array, default: proc { [] }

      def add(*nodes)
        nodes.each do |node|
          raise ArgumentError, "node #{node.inspect} is not a #{base_node_class}" unless node.is_a?(base_node_class)
          @nodes << node
        end
        self
      end

      def build
        reduce do |state, node|
          visit(state, node)
        end
      end

      def valid?
        nodes.any?(&:valid?)
      end

      private

      def reduce
        raise NotImplementedError
      end

      def base_node_class
        raise NotImplementedError
      end

      def visit(_state, _node)
        raise NotImplementedError
      end
    end
  end
end
