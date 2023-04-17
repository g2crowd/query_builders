module QueryBuilder
  module Characters
    module Nodes
      class IdIn < QueryBuilder::Nodes::Wheres::Base
        param :ids

        def clause
          Spell.where(id: ids)
        end

        def valid?
          ids.present?
        end
      end
    end
  end
end
