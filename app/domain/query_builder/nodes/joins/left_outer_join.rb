module QueryBuilder
  module Nodes
    module Joins
      class LeftOuterJoin < QueryBuilder::Nodes::Base
        include QueryBuilder::Nodes::Simple

        param :table1
        param :table2

        def clause
          table1.left_joins(table2)
        end
      end
    end
  end
end
