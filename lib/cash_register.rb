
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = {}
    end
  
    def add_item(title, price, quantity = 1)
      item_cost = price * quantity
      @total += item_cost
      quantity.times { @items << title }
      @last_transaction = { title: title, price: price, quantity: quantity }
    end
  
    def apply_discount
      if @discount > 0
        discount_amount = (@total * @discount / 100.0).to_i
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      last_item_price = @last_transaction[:price] * @last_transaction[:quantity]
      @total -= last_item_price
      @items.pop(@last_transaction[:quantity])
      @last_transaction = {}
      @total = 0.0 if @items.empty?
    end
  end
  