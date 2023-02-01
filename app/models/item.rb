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
end
