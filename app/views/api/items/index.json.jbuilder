json.items @items.each do |json, item|
  json.(item, :card_id, :name, :description, :created_at, :updated_at)
end
