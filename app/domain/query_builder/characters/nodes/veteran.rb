module QueryBuilder
  module Characters
    module Nodes
      class Veteran < ::QueryBuilder::Nodes::Wheres::Base
        def clause
          Character.where('experience > 10000')
        end
      end
    end
  end
end
