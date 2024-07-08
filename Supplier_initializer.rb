#supplier_initializer.rb

class Supplier_initializer
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def to_s
    "Name: #{@name}"
  end

  def display_supplier
    puts "Name: #{@name}"
  end
end