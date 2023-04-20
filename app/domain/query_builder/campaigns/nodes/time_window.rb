module QueryBuilder
  module Campaigns
    module Nodes
      class TimeWindow < QueryBuilder::Nodes::Wheres::Base
        option :start_date_lteq, proc(&:presence)
        option :start_date_gteq, proc(&:presence)

        def clause
          Campaign.where(start_date: start_date_gteq..start_date_lteq)
        end

        def valid?
          start_date_gteq.present? || start_date_lteq.present?
        end
      end
    end
  end
end
