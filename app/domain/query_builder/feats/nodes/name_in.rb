module QueryBuilder
  module Feats
    module Nodes
      class NameIn < QueryBuilder::Nodes::Wheres::Base
        param :names

        def clause
          Feat.where(name: names)
        end

        def valid?
          names.present?
        end
      end
    end
  end
end
