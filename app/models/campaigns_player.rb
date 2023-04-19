# == Schema Information
#
# Table name: campaigns_players
#
#  id          :bigint           not null, primary key
#  campaign_id :integer          not null
#  player_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CampaignsPlayer < ApplicationRecord
  belongs_to :campaign
  belongs_to :player
end
