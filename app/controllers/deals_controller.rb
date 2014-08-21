class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deals = current_user.deals.all.sort_by { |k,v| v }.reverse
	if @deals.count > 0
		@messages = Hash.new
		@deals.each do |deal|
			if !Message.where(deal_id: deal.id).empty?
				@messages[deal.id] = Message.where(deal_id: deal.id)
			end
		end
	end
	@newmessage = Message.new
  end

  def show
    
  end
  
  def new
	@deal = Deal.new
  end
  
  def create
    @deal = current_user.deals.build(deal_params)
    if @deal.save
   	  flash[:notice] = "Deal was successfully created."
	  redirect_to my_account_deals_path
    else
	  render :new
    end
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def destroy
  
  end

  private
    def deal_params
      params.require(:deal).permit(:short_description, :budget, :needed_by, :more_details)
    end
end
