# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  card_id     :integer          not null
#  name        :string(255)      not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base

  validates :name, :card_id, presence: true

  belongs_to :card, class_name: "Card", foreign_key: :card_id, primary_key: :id
end
