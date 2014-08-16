json.(@card, :list_id, :title, :created_at, :updated_at)

json.items @card.items.each do |json, item|
  json.(item, :card_id, :name, :description, :created_at, :updated_at)
end
