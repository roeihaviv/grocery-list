# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  category      :string
#  item          :string
#  picture       :string
#  related_items :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Item < ApplicationRecord
  belongs_to :user

  validates :item, presence: true

  enum status: {
    cart: "cart",
    end_soon: "end_soon",
    in_stock: "in_stock"
}
end
