# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text
#  start_date  :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Campaign < ApplicationRecord
  has_many :characters
end
