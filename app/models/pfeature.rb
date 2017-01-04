class Pfeature < ActiveRecord::Base
has_many :product_feature
   has_many :product, through: :product_feature

end
