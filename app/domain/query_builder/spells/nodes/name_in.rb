module QueryBuilder
  module Spells
    module Nodes
      class NameIn < QueryBuilder::Nodes::Wheres::Base
        param :names

        def clause
          Spell.where(name: names)
        end

        def valid?
          names.present?
        end
      end
    end
  end
end
