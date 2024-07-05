class ProductItems
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id 
    @name = name 
  end

  def displayProduct
    puts "ID: #{@id}, Name: #{@name}"
  end
end

class ProductsActualFile
  attr_accessor :items

  def initialize
    @items = []
  end

  def usingFile(filename)
    File.foreach(filename) do |line|
      id, name = line.chomp.split(',')
      @items << ProductItems.new(id, name)
    end
  end

  def displayProducts
    @items.each(&:displayProduct)
  end

  def addProduct(id, name)
    if @items.any? {|item| item.id == id || item.name == name}
      put "Error Product Already Exists in file"
    else      
      @items << ProductItems.new(id, name)
    end
  end



  def deleteProduct(name)
    @items.reject! { |item| item.name == name }
  end
end

productfiles = ProductsActualFile.new
productfiles.usingFile('products.txt')
productfiles.addProduct("6","Hello")

productfiles.addProduct("7","Hello")


productfiles.displayProducts










# class Supplier
#     attr_accessor :id, :name
  
#     def initialize(id, name)
#       @id = id
#       @name = name
#     end
  
#     def to_s
#       "ID: #{@id}, Name: #{@name}"
#     end
# end




#     # product.rb
# class Product  

#     def allProducts
#     end

#     end

#     def addProduct
#     end

#     def updateProduct
#     end

#     def deleteProduct
#     end

#     def search  #name of product
#     end

#     def list #all products
#     end
# end


# class Suppliers 
#     def addSupplier
#     end

#     def updateSupplier
#     end

#     def deleteSupplier
#     end

#     def search  #product search by its supplier
#     end

#     def list #all_suppliers
#     end

# end


# class Stock_level

#     def updateStocklevel  #used for product
#     end


# end




# puts "The Suppliers are Listed as Below "
# supplier_file = File.open("suppliers.txt",mode)
# puts supplier_file.inspect
# puts supplier_file.read








