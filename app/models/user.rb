class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	after_create :welcome_send
	after_update :password_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

	
  def password_send
    UserMailer.password_email(self).deliver_now
  end

end
