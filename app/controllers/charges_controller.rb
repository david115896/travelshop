class ChargesController < ApplicationController
	after_action :authenticate_user
 
	def new
	end

	def create
		# Amount in cents
		@amount = Cart.amount(Cart.where(user_id: current_user.id))
		
		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})
		begin
			charge = Stripe::Charge.create({
				customer: customer.id,
				amount: 100 * @amount.to_i,
				description: 'Rails Stripe customer',
				currency: 'usd',
			})
			begin 
				Order.add_order(current_user)
				redirect_to charges_path, flash: {success: 'Order was successfully created.'}
			rescue
				redirect_to carts_path,flash: { warning: 'An error occured. Contact us for more information'}
			end
		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
		end
	end

end
