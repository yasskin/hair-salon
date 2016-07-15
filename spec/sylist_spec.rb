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

  
end
