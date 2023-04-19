module QueryBuilder
  module Specializations
    module Nodes
      class NameIn < QueryBuilder::Nodes::Wheres::Base
        param :names

        def clause
          Specialization.where(name: names)
        end

        def valid?
          names.present?
        end
      end
    end
  end
end
