module QueryBuilder
  module Clauses
    module Joins
      class IncludesReferences < QueryBuilder::Clauses::Base
        include QueryBuilder::Clauses::Simple

        param :table1
        param :table2

        def clause
          table1.includes(table2).references(table2)
        end
      end
    end
  end
end
