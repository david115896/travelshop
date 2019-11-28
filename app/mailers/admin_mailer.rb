class AdminMailer < ApplicationMailer
	
	default from: 'floury-fabio@hotmail.fr'

  def order_email

		admins = User.where(is_admin: true)

		for admin in admins

			@user = admin 

			@url  = 'https://travel-shop.herokuapp.com/activities'

			mail(to: @user.email, subject: 'Commande effectué') 

		end
	end

end
