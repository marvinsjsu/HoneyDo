# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  created_by :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Board < ActiveRecord::Base

  validates :title, presence: true

  has_many :lists, class_name: "List", foreign_key: :board_id, primary_key: :id
  has_many :cards, class_name: "Card", through: :lists
  has_many :items, class_name: "Item", through: :cards

end
