# == Schema Information
#
# Table name: skills
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  description    :text             not null
#  core           :boolean
#  primary_stat   :string
#  secondary_stat :string
#  tertiary_stat  :string
#  requirements   :json
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Skill < ApplicationRecord
end
