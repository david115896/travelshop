class Admin::UsersController < ApplicationController
	before_action :authenticate_user
	before_action :authenticate_admin
	def index
		@soldItems = SoldItem.all
	end

end
