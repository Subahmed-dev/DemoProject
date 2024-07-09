#SupplierData.rb

require_relative 'Supplier'

module Suppliers 
  class SupplierData
    attr_accessor
    def initialize
      @s_items = []
    end


    def file_data(filename)
      File.foreach(filename) do |line|
        name = line.chomp
        @s_items << Supplier.new(name)        
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
        @s_items << Supplier.new(name)
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