module QueryBuilder
  module Spells
    module Nodes
      class LevelIn < QueryBuilder::Nodes::Wheres::Base
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
