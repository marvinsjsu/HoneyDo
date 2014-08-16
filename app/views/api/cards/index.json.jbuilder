json.cards @cards.each do |json, card|
  json.(card, :list_id, :title)

  json.items card.items.each do |json, item|
    json.(item, :card_id, :name, :description, :created_at, :updated_at)
  end
end
