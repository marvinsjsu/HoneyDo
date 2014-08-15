# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  board_id   :integer          not null
#  title      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base

  validates :board_id, :title, presence: true

  belongs_to :board, class_name: "Board", foreign_key: :board_id, primary_key: :id
  has_many :cards, class_name: "Card", foreign_key: :list_id, primary_key: :id
  has_many :items, class_name: "Item", through: :cards
end
