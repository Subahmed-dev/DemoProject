#product_data.rb


require_relative 'Product'
module Products

  class ProductsData
    attr_accessor :items
    def initialize
      @items = []
    end


    def file_data(filename)
      File.foreach(filename) do |line|
        id, name, stock_level = line.chomp.split(',')
        @items << Product.new(id, name, stock_level)
      end
    end




    def add_product(id, name,stock_level)
      if @items.any? {|item| item.name == name}
        puts "Error Product Already Exists in file"
        puts
      else      
        @items << Product.new(id, name, stock_level)
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