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

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @client = Clients.all()
  erb(:stylist)
end

post('/stylist') do
  @name = params.fetch('name')
  train = Stylist.new({:name => @name})
  train.save()
  erb(:stylist_success)
end

get('/stylist/:id') do

end
