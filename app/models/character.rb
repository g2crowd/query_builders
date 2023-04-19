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
  belongs_to :campaign, dependent: :destroy
  belongs_to :players, dependent: :destroy
  has_many :characters_spells
  has_many :spells, through: :characters_spells
  has_many :characters_feats
  has_many :feats, through: :characters_feats
  has_many :characters_flaws
  has_many :flaws, through: :characters_flaws
  has_many :characters_virtues
  has_many :virtues, through: :characters_virtues
  has_many :characters_skills
  has_many :skills, through: :characters_skills
  has_many :characters_specializations
  has_many :specializations, through: :characters_specializations
  has_one :inventory
  has_many :inventories_items, through: :inventory
  has_many :items, through: :inventories_items
end
