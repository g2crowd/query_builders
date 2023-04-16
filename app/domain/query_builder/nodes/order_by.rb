module QueryBuilder
  module Nodes
    class OrderBy < QueryBuilder::Nodes::Base
      param :sort

      def accept(state)
        state.order(sort)
      end
    end
  end
end
