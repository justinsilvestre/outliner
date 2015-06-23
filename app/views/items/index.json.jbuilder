json.array!(@items) do |item|
  json.extract! item, :id, :content, :note, :completed, :expanded
  json.url item_url(item, format: :json)
end
