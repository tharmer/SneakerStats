json.array!(@sneakers) do |sneaker|
  json.extract! sneaker, :id, :brand, :name, :style, :buy
  json.url sneaker_url(sneaker, format: :json)
end
