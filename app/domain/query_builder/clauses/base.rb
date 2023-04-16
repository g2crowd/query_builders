module QueryBuilder
  module Clauses
    class Base
      extend Dry::Initializer

      def accept(_state)
        raise NotImplementedError
      end

      def valid?
        true
      end
    end
  end
end
