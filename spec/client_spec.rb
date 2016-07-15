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

end
