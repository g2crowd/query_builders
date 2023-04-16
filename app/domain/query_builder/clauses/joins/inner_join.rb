module QueryBuilder
  module Clauses
    module Joins
      class InnerJoin < ::QueryBuilder::Clauses::Base
        include QueryBuilder::Clauses::Simple

        param :table1
        param :table2

        def clause
          table1.joins(table2)
        end
      end
    end
  end
end
