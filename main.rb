#maib.rb

require_relative 'Product_data'
require_relative 'Supplier_data'



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



