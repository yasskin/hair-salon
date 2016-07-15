require ('helper_spec')

describe(Stylist) do

  describe('.all') do
    it('shows the Stylist class as empty upon initialization') do
      expect(Stylist.all()).to(eq([]))
    end
  end

end
