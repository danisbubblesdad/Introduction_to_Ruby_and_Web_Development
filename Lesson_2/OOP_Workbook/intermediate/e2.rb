# => Alyssa created the following code to keep track of items for a shopping
# => cart application she's writing:
require 'pry'
class InvoiceEntry
  attr_accessor :quantity # add quantity to accessor
  attr_reader :product_name, # remove :quantity from reader

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  # => Alan looked at the code and spotted a mistake. "This will fail when
  # => update_quantity is called", he says.

  # => Can you spot the mistake and how to address it?

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
    # Since quantity is an instance variable, the setter method needs us to
    # point at self. Or, we could not add the setter method and point at 
    # @quantity.
  end
end

item = InvoiceEntry.new("Item1", 1)
item.update_quantity(5)
p item
