class AdminMailer < ApplicationMailer
	
	default from: 'floury-fabio@hotmail.fr'

  def order_email(buyer, order)

		admins = User.where(is_admin: true)
		@buyer = buyer
		@order = order

		for admin in admins
			@user = admin 
			@url  = 'https://travel-shop.herokuapp.com/admin/users'
			mail(to: @user.email, subject: 'Order received') 
		end
	end

end
