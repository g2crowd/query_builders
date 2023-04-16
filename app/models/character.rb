# == Schema Information
#
# Table name: characters
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  version      :integer          default(1), not null
#  origin_story :text
#  player_id    :integer
#  campaign_id  :integer
#  age          :integer
#  gender       :string
#  size         :string           not null
#  species      :string           not null
#  height       :float
#  weight       :float
#  experience   :integer
#  strength     :integer          not null
#  agility      :integer          not null
#  health       :integer          not null
#  reasoning    :integer          not null
#  memory       :integer          not null
#  intuition    :integer          not null
#  beauty       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Character < ApplicationRecord

  has_many :characters_spells
  has_many :spells, through: :characters_spells
end
