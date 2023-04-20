module Queries
  class Base
    extend Dry::Initializer
    include Queries::Helpers::Joins::Filter
    include Queries::Helpers::Wheres

    option :builder, default: proc { ::QueryBuilder::Builders::Default.new(initial_state: initial_state) }
    option :filters, type: ::Types::Hash.constructor(&:to_h), default: proc { {} }

    def call
      apply
      builder.build
    end

    private

    def initial_state
      raise NotImplementedError
    end

    def apply
      raise NotImplementedError
    end

    def left_outer_join(model, table_name)
      QueryBuilder::Nodes::Joins::LeftOuterJoin.new(model, table_name)
    end

    def inner_join(model, table_name)
      QueryBuilder::Nodes::Joins::InnerJoin.new(model, table_name)
    end
  end
end
