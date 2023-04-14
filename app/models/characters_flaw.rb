# == Schema Information
#
# Table name: characters_flaws
#
#  id            :bigint           not null, primary key
#  character_id  :integer          not null
#  flaw_id       :integer          not null
#  permanence    :integer          default(3)
#  backstory     :text
#  modifications :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CharactersFlaw < ApplicationRecord
end
