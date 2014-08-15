json.(@board, :title, :created_by, :created_at, :updated_at)

json.lists @board.lists do |json, list|
    json.(list, :board_id, :title)
end

