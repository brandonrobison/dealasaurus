class MessagesController < ApplicationController

	def index
	end
	
	def create
		if Deal.find(params[:message][:deal_id]).user_id == current_user.id or current_user.try(:admin?)
			@newmessage = Message.new(message_params)
			@newmessage[:user_id] = current_user.id
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
		else
			flash[:error] = "Naughty child."
			redirect_to my_account_deals_path
		end
	end
	
	private
		def message_params
			params.require(:message).permit(:message, :user_id, :deal_id)
		end
end
