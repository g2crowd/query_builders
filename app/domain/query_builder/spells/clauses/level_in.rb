module QueryBuilder
  module Spells
    module Clauses
      class LevelIn < QueryBuilder::Clauses::Wheres::Base
        param :levels

        def clause
          Spell.where(level: levels)
        end

        def valid?
          levels.present?
        end
      end
    end
  end
end