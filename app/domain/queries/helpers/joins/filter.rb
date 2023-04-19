module Queries
  module Helpers
    module Joins
      module Filter
        def apply_joins
          tables.select { |table_name| filters[table_name].present? }.each do |table_name|
            builder.add(::QueryBuilder::Nodes::Joins::InnerJoin.new(initial_state, table_name))
          end
        end

        def tables
          %i(characters flaws virtues feats spells skills specializations)
        end
      end
    end
  end
end
