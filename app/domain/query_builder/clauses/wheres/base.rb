module QueryBuilder
  module Clauses
    module Wheres
      class Base < ::QueryBuilder::Clauses::Base
        include QueryBuilder::Clauses::Simple
      end
    end
  end
end
