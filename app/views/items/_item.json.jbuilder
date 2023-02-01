json.extract! item, :id, :item, :related_items, :status, :category, :picture, :created_at, :updated_at
json.url item_url(item, format: :json)
