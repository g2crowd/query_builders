# == Schema Information
#
# Table name: inventories_items
#
#  id            :bigint           not null, primary key
#  inventory_id  :integer          not null
#  item_id       :integer          not null
#  equipped      :boolean          default(FALSE)
#  condition     :integer          default(100)
#  modifications :json
#  price         :decimal(, )
#  price_unit    :string           default("gp")
#  weight        :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class InventoriesItem < ApplicationRecord
  self.table_name = 'inventories_items'

  belongs_to :inventory
  belongs_to :item
end
