class Product < ActiveRecord::Base
has_many :product_feature
  has_many :pfeature, through: :product_feature

end
