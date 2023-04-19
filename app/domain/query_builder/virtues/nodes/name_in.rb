module QueryBuilder
  module Virtues
    module Nodes
      class NameIn < QueryBuilder::Nodes::Wheres::Base
        param :names

        def clause
          Virtue.where(name: names)
        end

        def valid?
          names.present?
        end
      end
    end
  end
end
