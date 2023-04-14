# == Schema Information
#
# Table name: specializations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  properties  :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Specialization < ApplicationRecord
end
