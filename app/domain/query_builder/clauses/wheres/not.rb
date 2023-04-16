module QueryBuilder
  module Clauses
    module Wheres
      class Not < ::QueryBuilder::Clauses::Wheres::Base
        param :nested

        delegate :valid?, to: :nested

        def clause
          nested.clause.invert_where
        end
      end
    end
  end
end
