module QueryBuilder
  module Nodes
    module Joins
      class InnerJoin < ::QueryBuilder::Nodes::Base
        include QueryBuilder::Nodes::Simple

        param :table1
        param :table2

        def clause
          table1.joins(table2)
        end
      end
    end
  end
end
