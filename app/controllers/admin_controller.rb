class AdminController < ApplicationController
	before_filter :ensure_admin
	
	def index
		@users = Hash.new
		@u = User.all
		@u.each do |u|
			@users[u.id] = u
		end
		@deals = Deal.all.sort_by { |k,v| v }.reverse
		@messages = Hash.new
		if @deals.count > 0
			@deals.each do |deal|
				if !Message.where(deal_id: deal.id).empty?
					@messages[deal.id] = Message.where(deal_id: deal.id)
				end
			end
		end
		@newmessage = Message.new
	end
	
	
	
	private
		def ensure_admin
			redirect_to root_path unless current_user.try(:admin?)
		end
end
