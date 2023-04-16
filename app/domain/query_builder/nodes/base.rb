module QueryBuilder
  module Nodes
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
