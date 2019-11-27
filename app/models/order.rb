class Order < ApplicationRecord
    belongs_to :user
    has_many :sold_items

    def self.add_items(user_id, order_id)
        items = Cart.where(user_id: user_id)
        items.each do |item|
            SoldItem.create(order_id: order_id, user_id: user_id, activity_id: item.activity.id )
        end
    end
end
