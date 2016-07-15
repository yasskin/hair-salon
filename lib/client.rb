require('pry')

class Client
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes[:id]
    end

  define_singleton_method(:all) do
     returned_clients = DB.exec("SELECT * FROM clients;")
     clients = []
     returned_clients.each() do |client|
       id = client.fetch('id').to_i()
       name = client.fetch('name')
       clients.push(Client.new({:name => name, :id => id}))
     end
     clients
   end

   define_method(:==) do |another_client|
     result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
     @id = result.first().fetch('id').to_i()
   end

end
