module QueryBuilder
  module Clauses
    class OrderBy < QueryBuilder::Clauses::Base
      param :sort

      def accept(state)
        state.order(sort)
      end
    end
  end
end
