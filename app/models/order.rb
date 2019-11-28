class Order < ApplicationRecord

    #after_create :order_send
		after_create :admin_send

    belongs_to :user
    has_many :sold_items

    def self.add_items(user_id, order_id)
        items = Cart.where(user_id: user_id)
        items.each do |item|
            SoldItem.create(order_id: order_id, user_id: user_id, activity_id: item.activity.id )
        end
    end
    def self.add_order(current_user)
        @order = Order.new
        @order.user = current_user
        @order.save
        Order.add_items(current_user.id, @order.id)
        Cart.destro(current_user.id)
        UserMailer.order_email(current_user).deliver
    end

		def admin_send
			AdminMailer.order_email.deliver
		end
end
