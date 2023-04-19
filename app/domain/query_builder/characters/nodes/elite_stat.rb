module QueryBuilder
  module Characters
    module Nodes
      class EliteStat < QueryBuilder::Nodes::Wheres::Base
        param :stat_name

        def clause
          Character.where("#{stat_name} >= 18")
        end
      end
    end
  end
end
