# To keep things elegant, I'm going to create a Product class that doesn't know anything about exemptions or whether it was imported
# That logic will belong to the ShoppingCart class

class Product

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

class ShoppingCart

  # Exemptions lists (3 categories: books, food, medical)
  @@exemption_list_books = ["book"]
  @@exemption_list_food = ["chocolate bar", "box of chocolates", "chocolates"]
  @@exemption_list_medical = ["headache pills"]

  # Tax rates
  @@sales_tax = 0.1
  @@imported_goods_sales_tax = 0.05

  # Our master list of all items in the shopping cart
  @items

  # Input: none
  # Return: items array?
  def initialize
    @items = []
  end

  # Input: item is a Product object
  # Return: items array
  def addItem(item)
    @items << item
  end

  # Input: none
  # Return: total price of all items in the shopping cart, including sales tax and imported sales tax applied where appropriate
  def calculate_price
    result = 0.0
    @items.each do |item|
      name = item.name
      price = item.price
      final_taxed_price = price # Begin with price and add tax as necessary
      tax = 0.0

      # Is the item subject to sales tax (ie. not exempt)?
      if !is_exempt(name)
        # Not exempt, apply sales tax
        tax += price * @@sales_tax
      else
        # Exempt, don't apply sales tax
      end

      # Is the item subject to import tax (ie. is it imported)?
      if is_imported(name)
        # Is imported, apply import sales tax
        tax += price * @@imported_goods_sales_tax
      else
        # Is not imported, don't apply import sales tax
      end

      final_taxed_price += round_point05(tax)

      puts final_taxed_price

      result += final_taxed_price # Add the final price to the running total
    end
    result
  end

  # Input: a string representing the name of a product
  # Return: true if the Product represented by the item_name string belongs to one of the exemption lists, false otherwise
  def is_exempt(item_name)
    # Check books
    if @@exemption_list_books.any? { |s| item_name.include? s }
      return true
    end

    # Check food
    if @@exemption_list_food.any? { |s| item_name.include? s }
      return true
    end

    # Check medical
    if @@exemption_list_medical.any? { |s| item_name.include? s }
      return true
    end

  end

  # Input: a string representing the name of a product
  # Return: true if the Product represented by the item_name string contains the substring "imported", false otherwise
  def is_imported(item_name)
    item_name.include? "imported"
  end

  def round_point05(number)
    (number*20.0).round / 20.0
  end

end

product_list1 = []
product_list1 << Product.new("book", 12.49)
product_list1 << Product.new("music CD", 14.99)
product_list1 << Product.new("chocolate bar", 0.85)

product_list2 = []
product_list2 << Product.new("imported box of chocolates", 10.00)
product_list2 << Product.new("imported bottle of perfume", 47.50)

product_list3 = []
product_list3 << Product.new("imported bottle of perfume", 27.99)
product_list3 << Product.new("bottle of perfume", 18.99)
product_list3 << Product.new("packet of headache pills", 9.75)
product_list3 << Product.new("box of imported chocolates", 11.25)

puts product_list1.inspect
puts product_list2.inspect
puts product_list3.inspect

puts

shopping_cart1 = ShoppingCart.new()
product_list1.each do |item|
  shopping_cart1.addItem(item)
end

shopping_cart2 = ShoppingCart.new()
product_list2.each do |item|
  shopping_cart2.addItem(item)
end

shopping_cart3 = ShoppingCart.new()
product_list3.each do |item|
  shopping_cart3.addItem(item)
end

puts shopping_cart1.inspect
puts shopping_cart2.inspect
puts shopping_cart3.inspect

puts

puts "Shopping Cart 1 Total: #{shopping_cart1.calculate_price}"
puts "Shopping Cart 2 Total: #{shopping_cart2.calculate_price}"
puts "Shopping Cart 3 Total: #{shopping_cart3.calculate_price}"
