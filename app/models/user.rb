class User < ApplicationRecord
  #after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
 
 validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci d'inserer un email valide" }
 validates :first_name, presence: true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :last_name, presence:true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :address, presence:true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
 validates :encrypted_password, presence: true, length: {minimum: 6} 
    
 has_many :carts
 has_many :activities, through: :carts

end
