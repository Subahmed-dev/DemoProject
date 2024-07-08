class Product_initializer
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


module Suppliers 
  class Supplier_data
    attr_accessor
    def initialize
      @s_items = []
    end


    def file_data(filename)
      File.foreach(filename) do |line|
        name = line.chomp
        @s_items << Supplier_initializer.new(name)        
      end
    end

    def update_suppliers(name)
      supplier = @s_items.find {|item| item.name == name}

      if supplier
        print "Enter Name of new Supplier: "

        suppliername = gets.chomp          
        supplier.name = suppliername


        puts "Supplier Name updated Successfully"
      else

        puts "Supplier Doesn't Exist"
      end
        
        
    end

    def display_supplier
      @s_items.each(&:display_supplier)
    end

    def delete_supplier(name)
      @s_items.delete_if {|item| item.name == name}
    end

    def add_supplier(name)
      if @s_items.any? {|item| item.name == name}
        puts "Error. Supplier already exists"

      else
        @s_items << Supplier_initializer.new(name)
      end
    end


    def supplier_save_to_file(output_file)
      begin
        File.open(output_file, 'w') do |file|
          @s_items.each do |item|
            file.puts(item)
          end
        end
      end
    end


  end
end



module Products

  class Products_data
    attr_accessor :items
    def initialize
      @items = []
    end


    def file_data(filename)
      File.foreach(filename) do |line|
        id, name, stock_level = line.chomp.split(',')
        @items << Product_initializer.new(id, name, stock_level)
      end
    end




    def add_product(id, name,stock_level)
      if @items.any? {|item| item.name == name}
        puts "Error Product Already Exists in file"
        puts
      else      
        @items << Product_initializer.new(id, name, stock_level)
      end
    end



    def delete_product(name)
      @items.delete_if{ |item| item.name == name }
    end

    # def update_product(name)
    #   if @items.any? {|item| item.name == name}
    #     print "Input New Product Name"
    #     productname = gets.chomp
    #     @items.map! {|item| item.name == name ? productname : item}

    #   else 
    #     puts "Product doesnt exist"
    #   end
    # end 

    def update_product(name)
      product = @items.find { |item| item.name == name }
      
      if product
        print "Input New Product Name: "
        productname = gets.chomp
        product.name = productname
        puts "Product name updated successfully."
      else
        puts "Product doesn't exist."
      end
    end

    def search_product(name)
      found = @items.any? {|item| item.name == name}
      if found
        puts "Product is found in the file that is  #{name}"

      else 
        puts "Product does not exist"
      end
    end
    

    def update_stock_level(name)
      product = @items.find{|item| item.name == name}

      if product
        print "Input New Stock Level: "
        product_stock_level = gets.chomp

        product.stock_level = product_stock_level
        puts "Product Stock Level Updated Successfully "

      else
        puts "Product Does Not Exist "
      end

    end


    def display_products
      @items.each(&:display_product)
    end




    def save_to_file(output_file)
      begin
        File.open(output_file, 'w') do |file|
          @items.each do |item|
            file.puts(item)
          end
        end
      end
    end

  end


end

productfiles = Products::Products_data.new
productfiles.file_data('products.txt')
puts



supplierfiles = Suppliers::Supplier_data.new
supplierfiles.file_data('suppliers.txt')

productfiles.display_products
puts 
supplierfiles.display_supplier
puts puts



loop do
  puts "Enter 1 to Remove Product"
  puts "Enter 2 to Update Product"
  puts "Enter 3 to Add Product"
  puts "Enter 4 to Search Product"



  puts "Enter 5 to Remove Supplier"
  puts "Enter 6 to Update Supplier"
  puts "Enter 7 to Add Supplier"

  puts "Enter 8 to Update Stock Level"

  puts "Enter 9 to List all Products"
  puts "Enter 10 to List all Suppliers"
  puts "Enter 11 to Exit Application"

  number = gets.chomp.to_i

  if number == 1
    productfiles.delete_product("Components")
  end

  if number == 2
    productfiles.update_product("Components")
  end

  if number == 3
    productfiles.add_product("6","Hello","123")
  end

  if number == 4
    productfiles.search_product("Components")
  end

  if number == 5
    supplierfiles.delete_supplier("David")
  end
  if number == 6
    supplierfiles.update_suppliers("Simon")
  end
  if number == 7
    supplierfiles.add_supplier("Jonny")
  end
  if number == 8
    productfiles.update_stock_level("Components") 
  end
  if number == 9
    productfiles.display_products
  end
  if number == 10
    supplierfiles.display_supplier
  end
  break if number == 11
  

end


puts "App is closing"
productfiles.save_to_file('final_products.txt')
supplierfiles.supplier_save_to_file('final_suppliers.txt')

puts puts



