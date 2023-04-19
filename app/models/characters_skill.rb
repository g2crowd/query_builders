# == Schema Information
#
# Table name: characters_skills
#
#  id            :bigint           not null, primary key
#  character_id  :integer          not null
#  skill_id      :integer          not null
#  trained_level :integer
#  backstory     :text
#  modifications :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CharactersSkill < ApplicationRecord
  belongs_to :character
  belongs_to :skill
end
