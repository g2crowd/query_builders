module QueryBuilder
  module Flaws
    module Nodes
      class NameIn < QueryBuilder::Nodes::Wheres::Base
        param :names

        def clause
          Flaw.where(name: names)
        end

        def valid?
          names.present?
        end
      end
    end
  end
end
