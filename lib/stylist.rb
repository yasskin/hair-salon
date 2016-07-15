require('pry')

class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch('id').to_i()
      stylist = stylist.fetch('name')
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

end
