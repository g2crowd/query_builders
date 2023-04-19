module QueryBuilder
  module Campaigns
    module Nodes
      class TimeWindow < QueryBuilder::Nodes::Wheres::Base
        option :started_at_lteq, proc(&:presence)
        option :started_at_gteq, proc(&:presence)

        def clause
          Campaign.where(started_at: started_at_gteq..stated_at_lteq)
        end

        def valid?
          started_at_gteq.present? || started_at_lteq.present?
        end
      end
    end
  end
end
