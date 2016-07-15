require('helper_spec')

describe(Client) do

  describe('.all') do
     it("shows the  array as empty at first") do
       expect(Client.all()).to(eq([]))
     end
   end

end
