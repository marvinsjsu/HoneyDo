json.lists @lists.each do |json, list|
  json.(list, :board_id, :title, :created_at, :updated_at)

  json.cards list.cards.each do |json, card|
    json.(card, :list_id, :title, :created_at, :updated_at)
  end
end
