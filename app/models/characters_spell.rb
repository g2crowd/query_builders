# == Schema Information
#
# Table name: characters_spells
#
#  id            :bigint           not null, primary key
#  character_id  :integer          not null
#  spell_id      :integer          not null
#  backstory     :text
#  modifications :json
#
class CharactersSpell < ApplicationRecord
  self.table_name = 'characters_spells'

  belongs_to :character
  belongs_to :spell
end
