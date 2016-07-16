require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end

post('/stylists') do
  name = params.fetch('stylist-name')
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/stylists/:id') do
  name = params.fetch('stylist_client')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:stylist)
end

patch('/stylists/:id') do
  name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylist)
end
