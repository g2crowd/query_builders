module QueryBuilder
  module Campaigns
    module Nodes
      class TitleIn < QueryBuilder::Nodes::Wheres::Base
        param :titles

        def clause
          Campaign.where(title: titles)
        end

        def valid?
          titles.present?
        end
      end
    end
  end
end
