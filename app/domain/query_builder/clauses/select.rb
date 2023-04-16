module QueryBuilder
  module Clauses
    class Select < ::QueryBuilder::Clauses::Base
      include QueryBuilder::Clauses::Simple

      param :relation
      param :columns

      def clause
        relation.select(columns)
      end
    end
  end
end
