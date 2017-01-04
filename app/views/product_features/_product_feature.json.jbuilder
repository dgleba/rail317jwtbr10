json.extract! product_feature, :id, :name, :product_id, :pfeature_id, :active_status, :sort, :created_at, :updated_at
json.url product_feature_url(product_feature, format: :json)