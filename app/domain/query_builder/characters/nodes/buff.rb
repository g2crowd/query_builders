module QueryBuilder
  module Characters
    module Nodes
      class Buff < ::QueryBuilder::Nodes::Wheres::Base
        include Queries::Helpers::Wheres
        attr_reader :builder

        # rubocop:disable Lint/MissingSuper
        def initialize
          @builder = QueryBuilder::Builders::Wheres.new
        end
        # rubocop:enable Lint/MissingSuper

        def clause
          builder.add(wheres_operator(:or, *child_nodes))
          builder.build
        end

        def child_nodes
          %w(strength health agility reasoning memory intuition beauty).map do |stat_name|
            QueryBuilder::Characters::Nodes::EliteStat.new(stat_name)
          end
        end
      end
    end
  end
end
