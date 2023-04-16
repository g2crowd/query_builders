module QueryBuilder
  module Nodes
    class SelectDistinct < ::QueryBuilder::Nodes::Base
      include QueryBuilder::Nodes::Simple

      param :relation
      param :columns

      def clause
        relation.select(columns).distinct
      end
    end
  end
end
