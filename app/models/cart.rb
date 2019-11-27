class Cart < ApplicationRecord

    belongs_to :user
    belongs_to :activity

    def self.amount(items)
        amount = 0
        items.each do |item|
            amount += item.activity.price
        end
        return amount
    end

    def self.destro(user_id)
        @carts_user = Cart.where(user_id: user_id)
        @carts_user.each do |cart|
            cart.destroy
        end
    end
end
