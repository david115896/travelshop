class UserMailer < ApplicationMailer

	 default from: 'floury-fabio@hotmail.fr'

 
  def welcome_email(user)
    @user = user 

    @url  = 'https://travel-shop.herokuapp.com/activities'

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def password_email(user)
    @user = user 

    @url  = 'https://travel-shop.herokuapp.com/activities'

    mail(to: @user.email, subject: 'Changement de mot de passe') 
  end

end
