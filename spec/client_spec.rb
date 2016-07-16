require('helper_spec')

describe(Client) do

  describe('.all') do
     it("shows a new instance of the Client object as empty at first") do
       expect(Client.all()).to(eq([]))
     end
   end

 describe('#==') do
   it("shows a client as being equal to another client when they share the same id and name") do
     client1 = Client.new({:id => nil, :name => "Darth Vader", :stylist_id => 1})
     client2 = Client.new({:id => nil, :name => "Darth Vader", :stylist_id => 1})
     expect(client1).to(eq(client2))
   end
 end

 describe('#save') do
     it("saves a new Client object into the hair_salon database") do
       test_client = Client.new({:id => nil, :name => "Rey", :stylist_id => 1})
       test_client.save()
       expect(Client.all()).to(eq([test_client]))
     end
   end

   describe('.find') do
     it('returns a client by an id') do
       test_client1 = Client.new({:id => nil, :name => "Yoda", :stylist_id => 1})
       test_client2 = Client.new({:id => nil, :name => "Princess Leia", :stylist_id => 1})
       test_client1.save()
       test_client2.save()
       expect(Client.find(test_client2.id())).to(eq(test_client2))
     end
   end

   describe('#delete') do
     it('deletes a client from the hair_salon database') do
       client = Client.new({:id => nil, :name => "Padmé Amidala", :stylist_id => 1})
       client.save()
       client.delete()
       expect(Client.all()).to(eq([]))
     end
   end

   describe('#update') do
     it('lets you update clients in the hair_salon database') do
       client = Client.new({:id => nil, :name => "Po", :stylist_id => 1})
       client.save()
       client.update({:name => "C3PO", :stylist_id => 2})
       expect(client.stylist_id()).to(eq(2))
     end
   end

 end
