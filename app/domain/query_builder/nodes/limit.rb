module QueryBuilder
  module Nodes
    class Limit < QueryBuilder::Nodes::Base
      param :numeric

      def accept(state)
        state.limit(numeric)
      end
    end
  end
end
