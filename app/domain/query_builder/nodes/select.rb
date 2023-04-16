module QueryBuilder
  module Nodes
    class Select < ::QueryBuilder::Nodes::Base
      include QueryBuilder::Nodes::Simple

      param :relation
      param :columns

      def clause
        relation.select(columns)
      end
    end
  end
end
