require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylist_success') do
  @stylists = Stylist.all()
  erb(:stylist_success)
end

post('/stylist_success') do
  @name = params.fetch('stylist-name')
  stylist = Stylist.new({:id => nil, :name => @name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylist_success)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @clients = Client.all()
  erb(:stylist)
end
