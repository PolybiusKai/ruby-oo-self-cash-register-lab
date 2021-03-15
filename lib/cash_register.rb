
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount=0)
        self.total = 0
        self.discount = discount
        self.items = []
    end 

    def add_item(title, price, quantity= 1)
        self.total += price * quantity
        quantity.times{self.items << title}
        @transaction = [title, price, quantity]

    end

    def apply_discount
        self.total -= self.total * self.discount / 100.00.to_i
        self.discount == 0? "There is no discount to apply.": "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.total -= @transaction[1] * @transaction[2]
        self.items.pop
    end
end