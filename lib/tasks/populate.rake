namespace :db do
  desc "fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    Product.populate 11 do |a12|
      a12.name     = Faker::Commerce.product_name
    end
    Pfeature.populate 9 do |a12|
      a12.name     = Faker::Commerce.color
    end
  end
end
