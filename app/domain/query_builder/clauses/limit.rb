module QueryBuilder
  module Clauses
    class Limit < QueryBuilder::Clauses::Base
      param :numeric

      def accept(state)
        state.limit(numeric)
      end
    end
  end
end
