module Queries
  class Base
    extend Dry::Initializer

    option :builder, default: proc { ::QueryBuilder::Builders::Default.new(initial_state: initial_state) }

    def call
      apply
      builder.build
    end

    private

    def initial_state
      ::Character
    end

    def apply
      raise NotImplementedError
    end

    def wheres_operator(operator, *clauses)
      "QueryBuilder::Clauses::Wheres::#{operator.to_s.camelize}".constantize.new(*clauses)
    end

    def left_outer_join(model, table_name)
      QueryBuilder::Clauses::Joins::LeftOuterJoin.new(model, table_name)
    end

    def inner_join(model, table_name)
      QueryBuilder::Clauses::Joins::InnerJoin.new(model, table_name)
    end
  end
end