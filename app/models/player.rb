# == Schema Information
#
# Table name: players
#
#  id             :bigint           not null, primary key
#  first_name     :string
#  last_name      :string
#  middle_name    :string
#  preferred_name :string
#  pronouns       :string
#  username       :string           not null
#  email          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Player < ApplicationRecord
end
