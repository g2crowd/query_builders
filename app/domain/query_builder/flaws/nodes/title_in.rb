module QueryBuilder
  module Flaws
    module Nodes
      class TitleIn < QueryBuilder::Nodes::Wheres::Base
        param :titles

        def clause
          Flaw.where(title: titles)
        end

        def valid?
          titles.present?
        end
      end
    end
  end
end
