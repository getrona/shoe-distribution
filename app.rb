ENV['RACK_ENV'] = 'test'
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/store")
require("./lib/brand")
require("pg")

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:shoe_stores)
end

post('/stores') do
  description = params.fetch('name')
  Store.new({:description => description}).save()
  @stores = Store.all()
  erb(:shoe_stores)
end

get('/brands') do
  @brands = Brand.all()
  erb(:shoe_brands)
end

post('/brands') do
  description = params.fetch('name')
  Brand.new({:description => description}).save()
  @brands = Brand.all()
  erb(:shoe_brands)
end

post('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  brand = Brand.find(params.fetch('brand_id'))
  @store.brands.push(brand)
  redirect "/stores/#{@store.id()}"
end


get ('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all()
  @stores = Store.all()
  erb(:shoe_store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  erb(:shoe_brand)
end

patch('/stores/:id') do
  description = params.fetch('name')
  @store = Store.find(params.fetch('id').to_i())
  @store.update({:description => description})
  redirect "/stores/#{@store.id()}"
end

patch('/brands/:id') do
  description = params.fetch('name')
  @brand = Brand.find(params.fetch('id').to_i())
  @brand.update({:description => description})
  redirect "/brands/#{@brand.id()}"
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  redirect '/'
end

delete('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @brand.destroy()
  redirect '/'
end
