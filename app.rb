require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

delete('/') do
  store = Store.find(params.fetch('store_id'))
  store.delete
  redirect to('/')
end

patch('/') do
  store = Store.find(params.fetch('store_id'))
  store.update({:name => params.fetch('name')})
  redirect to('/')
end

post('/store') do
  Store.create({:name => params.fetch('store').capitalize})
  redirect to('/')
end

post('/brand') do
  Brand.create({:name => params.fetch('brand').capitalize})
  redirect to('/')
end

get('/store/:id') do
  @store = Store.find(params.fetch('id'))
  erb(:store)
end

patch('/store/:id') do
  @store = Store.find(params.fetch('id'))
  if params.keys.include?('brand')
    brands = params.fetch('brand')
    @store.update({:brand_ids => brands})
  end
  redirect to("/store/#{@store.id}")
end
