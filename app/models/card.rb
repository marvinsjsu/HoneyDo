# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  list_id    :integer          not null
#  title      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Card < ActiveRecord::Base
  
  validates :list_id, :title, presence: true

  belongs_to :list, class_name: "List", foreign_key: :list_id, primary_key: :id
  has_many :items, class_name: "Item", foreign_key: :card_id, primary_key: :id
end
