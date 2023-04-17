module QueryBuilder
  module Nodes
    module Joins
      class IncludesReferences < QueryBuilder::Nodes::Base
        include QueryBuilder::Nodes::Simple

        param :table1
        param :table2

        def clause
          table1.includes(table2).references(table2)
        end
      end
    end
  end
end
