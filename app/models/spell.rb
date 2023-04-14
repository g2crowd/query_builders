# == Schema Information
#
# Table name: spells
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  level       :integer          default(1), not null
#  effects     :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Spell < ApplicationRecord
end
