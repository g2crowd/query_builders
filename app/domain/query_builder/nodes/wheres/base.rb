module QueryBuilder
  module Nodes
    module Wheres
      class Base < ::QueryBuilder::Nodes::Base
        include QueryBuilder::Nodes::Simple
      end
    end
  end
end
