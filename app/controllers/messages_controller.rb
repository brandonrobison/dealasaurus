class MessagesController < ApplicationController

	def index
	end
	
	def create
	    @newmessage = Message.new(message_params)
		if @newmessage.save
			flash[:notice] = "Message posted."
			if current_user.try(:admin?)
				redirect_to admin_path
			else
				redirect_to my_account_deals_path
			end
		else
			flash[:error] = "Problem posting message."
			render :new
		end
	end
	
	private
		def message_params
			params.require(:message).permit(:message, :user_id, :deal_id)
		end
end
