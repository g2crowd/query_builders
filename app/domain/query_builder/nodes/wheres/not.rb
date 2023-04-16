module QueryBuilder
  module Nodes
    module Wheres
      class Not < ::QueryBuilder::Nodes::Wheres::Base
        param :nested

        delegate :valid?, to: :nested

        def clause
          nested.clause.invert_where
        end
      end
    end
  end
end
