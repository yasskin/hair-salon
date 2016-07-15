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
     test_client2 = Client.new({:id => nil, :name => "Darth Vader"})
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

   describe('#update') do
     it('lets you update clients in the hair_salon database') do
       client = Client.new({:id => nil, :name => "Finn"})
       client.save()
       client.update({:name => "Finn"})
       expect(client.name()).to(eq("Finn"))
     end
    #  it("lets you add a stylist to a client") do
    #    client = Client.new({:id => nil, :name => "Boba Fett"})
    #    client.save()
    #    stylist = Stylist.new({:id => nil, :name => "Chewbacca"})
    #    stylist.save()
    #    client.update({:stylist_id => [stylist.id()]})
    #    expect(client.my_stylist()).to(eq([stylist]))
    #  end
   end

  #  describe("#my_stylist") do
  #    it("returns the stylist for a particular client") do
  #      client = Client.new({:id => nil, :name => "Maz Kanata"})
  #      client.save()
  #      stylist = Stylist.new({:id => nil, :name => "Captain Phasma"})
  #      stylist.save()
  #      client.update({:stylist_id => [stylist.id()]})
  #      expect(client.my_stylist()).to(eq([stylist]))
  #    end
  #  end

end
