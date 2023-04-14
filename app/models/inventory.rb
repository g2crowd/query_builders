# == Schema Information
#
# Table name: inventories
#
#  id              :bigint           not null, primary key
#  character_id    :integer
#  resource_id     :bigint
#  resource_type   :string
#  title           :string
#  description     :text
#  weight_limit    :float
#  item_limit      :integer
#  special_effects :json
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Inventory < ApplicationRecord
  self.table_name = 'inventories'
end
