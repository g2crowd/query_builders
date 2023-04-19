module Queries
  module Helpers
    module Wheres
      def wheres_operator(operator, *clauses)
        "QueryBuilder::Nodes::Wheres::#{operator.to_s.camelize}".constantize.new(*clauses)
      end
    end
  end
end
