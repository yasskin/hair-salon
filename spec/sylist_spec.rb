require ('helper_spec')

describe(Stylist) do

  describe('.all') do
    it('shows the Stylist class as empty upon initialization') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('shows a stylist as being == equal when they share the same name and id') do
    test_stylist1 = Stylist.new({:id => nil, :name => "Zohan"})
    test_stylist2 = Stylist.new({:id => nil, :name => "Zohan"})
    expect(test_stylist1).to(eq(test_stylist2))
    end
  end

  describe('#save') do
    it('saves a new Stylist object in the hair_salon database') do
      test_stylist = Stylist.new({:id => nil, :name => "Guy Fieri"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('.find') do
    it('returns a Stylist from a Stylist class by an ID') do
      test_stylist1 = Stylist.new({:id => nil, :name => "Laureal"})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:id => nil, :name => "Vidal"})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#delete') do
    it('deletes a stylist from the database') do
      stylist1 = Stylist.new({:id => nil, :name => "Dr. Bronner"})
      stylist1.save()
      stylist2 = Stylist.new({:id => nil, :name => "Dr. Oz"})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe('#update') do
     it("lets you update stylists in the database") do
       stylist = Stylist.new({:id => nil, :name => "Ruby"})
       stylist.save()
       stylist.update({:name => "Rails"})
       expect(stylist.name()).to(eq("Rails"))
     end

   describe("#clients") do
     it("returns all of the clients for a particular stylist") do
       stylist = Stylist.new({:id => nil, :name => "Zohan"})
       stylist.save()
       client1 = Client.new({:id => nil, :name => "Jack"})
       client1.save()
       client2 = Client.new({:id => nil, :name => "Jill"})
       client2.save()
       expect(stylist.clients()).to(eq([client1, client2]))
     end
    end
  end

end
