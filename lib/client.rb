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

   define_method(:save) do
     result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
     @id = result.first().fetch("id").to_i()
   end

   define_singleton_method(:find) do |id|
     result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
     name = result.first().fetch("name")
     Client.new({:id => id, :name => name})
    end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
      @name = attributes.fetch(:name, @name)
      @id = self.id()
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  # define_method(:my_stylist) do
  #   my_stylist
  #   results = DB.exec("SELECT stylist_id FROM clients WHERE client_id = #{self.id()};")
  #   results.each() do |result|
  #     stylist_id = result.fetch("stylist_id").to_i()
  #     stylist = DB.exec("SELECT * FROM stylists WHERE id = #{stylist_id};")
  #     name = stylist.first().fetch("name")
  #     clients.push(Stylist.new({:id => stylist_id, :name => name}))
  #   end
  #   my_stylist
  # end

end
