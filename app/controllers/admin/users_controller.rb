class Admin::UsersController < ApplicationController

	def index
		@soldItems = SoldItem.all
	end

end
