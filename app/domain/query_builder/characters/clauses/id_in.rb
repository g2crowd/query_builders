module QueryBuilder
  module Characters
    module Clauses
      class IdIn < QueryBuilder::Clauses::Wheres::Base
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