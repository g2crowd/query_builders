# == Schema Information
#
# Table name: characters_feats
#
#  id            :bigint           not null, primary key
#  feat_id       :integer          not null
#  character_id  :integer          not null
#  backstory     :text
#  modifications :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CharactersFeat < ApplicationRecord
end
