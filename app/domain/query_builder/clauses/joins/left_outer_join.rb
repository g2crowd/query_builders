module QueryBuilder
  module Clauses
    module Joins
      class LeftOuterJoin < QueryBuilder::Clauses::Base
        include QueryBuilder::Clauses::Simple

        param :table1
        param :table2

        def clause
          table1.left_joins(table2)
        end
      end
    end
  end
end
