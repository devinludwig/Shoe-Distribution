require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/store') do
  Store.create({:name => params.fetch('store')})
  redirect to('/')
end

post('/brand') do
  Brand.create({:name => params.fetch('brand')})
  redirect to('/')
end

get('/store/:id') do
  @store = Store.find(params.fetch('id'))
  erb(:store)
end

patch('/store/:id') do
  @store = Store.find(params.fetch('id'))
  brands = params.fetch('brand')
  @store.update({:brand_ids => brands})
  redirect to("/store/#{@store.id}")
end
