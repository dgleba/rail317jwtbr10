json.extract! product, :id, :name, :pdate, :active_status, :sort, :created_at, :updated_at
json.url product_url(product, format: :json)