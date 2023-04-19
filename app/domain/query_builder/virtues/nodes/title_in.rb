module QueryBuilder
  module Virtues
    module Nodes
      class TitleIn < QueryBuilder::Nodes::Wheres::Base
        param :titles

        def clause
          Virtue.where(title: titles)
        end

        def valid?
          titles.present?
        end
      end
    end
  end
end
