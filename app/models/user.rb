class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	after_create :welcome_send
	after_update :password_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

	
  def password_send
    UserMailer.password_email(self).deliver_now
  end
 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
 
 validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci d'inserer un email valide" }
 validates :first_name, presence: true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :last_name, presence:true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :address, presence:true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :encrypted_password, presence: true, length: {minimum: 6} 
    
 has_many :carts
 has_many :activities, through: :carts
 has_many :orders
 has_many :sold_items, through: :orders

end
