module QueryBuilder
  module Builders
    class Wheres < ::QueryBuilder::Builders::Base
      private

      def base_node_class
        QueryBuilder::Clauses::Wheres::Base
      end

      def reduce(&block)
        valid_nodes = nodes.select(&:valid?)
        raise 'no valid nodes' if valid_nodes.empty?
        head_node, *tail_nodes = valid_nodes
        tail_nodes.reduce(head_node.clause, &block)
      end
    end
  end
end
