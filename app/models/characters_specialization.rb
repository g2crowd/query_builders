# == Schema Information
#
# Table name: characters_specializations
#
#  id                :bigint           not null, primary key
#  character_id      :integer          not null
#  specialization_id :integer          not null
#  trained_levels    :integer          default(1), not null
#  backstory         :text
#  modifications     :json
#
class CharactersSpecialization < ApplicationRecord
  self.table_name = 'characters_specializations'
end
