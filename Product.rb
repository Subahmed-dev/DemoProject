#product_initilizer.rb

class Product
  attr_accessor :id, :name, :stock_level
  def initialize(id, name, stock_level)
    @id = id 
    @name = name 
    @stock_level = stock_level
  end


  def to_s
    "ID: #{@id}, Name: #{@name}, Stock_level: #{@stock_level}"
  end

  def display_product
    puts "Supplier ID: #{@id}, Name: #{@name}, Stock Level: #{stock_level}"
  end
end