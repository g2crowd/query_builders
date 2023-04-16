module QueryBuilder
  module Nodes
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
