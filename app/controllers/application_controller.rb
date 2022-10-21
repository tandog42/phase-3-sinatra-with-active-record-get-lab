class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

    get '/bakeries' do
      bakery = Bakery.all
      bakery.to_json
    end

    get '/bakeries/:id' do
      bake = Bakery.find(params[:id])
      bake.to_json(include: :baked_goods)
    end
  
    get '/baked_goods/by_price' do
    prices = BakedGood.order("price DESC" )
    prices.to_json
  end
  get '/baked_goods/most_expensive' do
    baked = BakedGood.order("price DESC").first
    baked.to_json
  end

end
