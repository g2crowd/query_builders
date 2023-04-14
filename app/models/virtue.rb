# == Schema Information
#
# Table name: virtues
#
#  id               :bigint           not null, primary key
#  title            :string           not null
#  description      :text             not null
#  magnitude        :string
#  modify_ac        :integer          default(0)
#  modify_hp        :integer          default(0)
#  modify_age       :integer          default(0)
#  modify_stamina   :integer          default(0)
#  modify_strength  :integer          default(0)
#  modify_agility   :integer          default(0)
#  modify_health    :integer          default(0)
#  modify_reasoning :integer          default(0)
#  modify_memory    :integer          default(0)
#  modify_intuition :integer          default(0)
#  modify_beauty    :integer          default(0)
#  special_effects  :json
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Virtue < ApplicationRecord
end
