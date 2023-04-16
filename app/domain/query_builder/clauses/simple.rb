module QueryBuilder
  module Clauses
    module Simple
      def clause
        raise NotImplementedError
      end

      def accept(state)
        state.merge(clause)
      end
    end
  end
end
