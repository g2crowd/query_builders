module QueryBuilder
  module Clauses
    class SelectDistinct < ::QueryBuilder::Clauses::Base
      include QueryBuilder::Clauses::Simple

      param :relation
      param :columns

      def clause
        relation.select(columns).distinct
      end
    end
  end
end
