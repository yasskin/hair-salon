require('helper_spec')

describe(Client) do

  describe('.all') do
     it("shows a new instance of the Client object as empty at first") do
       expect(Client.all()).to(eq([]))
     end
   end

 describe('#==') do
   it("shows a client as being equal to another client when they share the same id and name") do
     test_client1 = Client.new({:id => nil, :name => "Darth Vader"})
     test_client2 = Client.new({:id => nil, :name => "C3PO"})
     expect(test_client1).to(eq(test_client2))
   end
 end

 describe('#save') do
     it("saves a new Client object into the hair_salon database") do
       test_client = Client.new({:id => nil, :name => "Rey"})
       test_client.save()
       expect(Client.all()).to(eq([test_client]))
     end
   end

   describe('.find') do
     it('returns a client by an id') do
       test_client1 = Client.new({:id => nil, :name => "Yoda"})
       test_client2 = Client.new({:id => nil, :name => "Princess Leia"})
       test_client1.save()
       test_client2.save()
       expect(Client.find(test_client2.id())).to(eq(test_client2))
     end
   end

   describe('#delete') do
     it('deletes a client from the hair_salon database') do
       test_client = Client.new({:id => nil, :name => "Padmé Amidala"})
       test_client.save()
       test_client.delete()
       expect(Client.all()).to(eq([]))
     end
   end
 #
 #   describe('#update') do
 #     it('lets you update cities in the database') do
 #       client = Client.new({:id => nil, :name => "Chicago"})
 #       client.save()
 #       client.update({:name => "Miami"})
 #       expect(client.name()).to(eq("Miami"))
 #     end
 #     it("lets you add a stylist to a client") do
 #       client = Client.new({:id => nil, :name => "Dallas"})
 #       client.save()
 #       stylist = Client.new({:id => nil, :name => "Thomas"})
 #       stylist.save()
 #       stylist2 = Client.new({:id => nil, :name => "The Little Engine that Could"})
 #       stylist2.save()
 #       client.update({:stylist_ids => [stylist.id(), stylist2.id()]})
 #       expect(client.stylists()).to(eq([stylist, stylist2]))
 #     end
 #   end
 #
 #   describe("#stylists") do
 #     it("returns all of the stylists for a particular client") do
 #       client = Client.new({:id => nil, :name => "Chicago"})
 #       client.save()
 #       stylist1 = Client.new({:id => nil, :name => "stylist Object"})
 #       stylist1.save()
 #       stylist2 = Client.new({:id => nil, :name => "stylist Class"})
 #       stylist2.save()
 #       client.update({:stylist_ids => [stylist1.id(), stylist2.id()]})
 #       expect(client.stylists()).to(eq([stylist1, stylist2]))
 #     end
 #   end


end
