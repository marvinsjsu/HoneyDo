json.boards @boards.each do |json, board|
  json.(board, :title, :created_by, :created_at, :updated_at)

  json.lists board.lists do |json, list|
    json.(list, :board_id, :title, :created_at, :updated_at)

    json.cards list.cards.each do |json, card|
      json.(card, :list_id, :title, :created_at, :updated_at)

      json.items card.items.each do |json, item|
        json.(item, :card_id, :name, :description, :created_at, :updated_at)
      end
    end
  end
end
