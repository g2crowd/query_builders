# == Schema Information
#
# Table name: characters_virtues
#
#  id            :bigint           not null, primary key
#  character_id  :integer          not null
#  virtue_id     :integer          not null
#  permanence    :integer          default(3)
#  backstory     :text
#  modifications :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CharactersVirtue < ApplicationRecord
  belongs_to :character
  belongs_to :virtue
end
