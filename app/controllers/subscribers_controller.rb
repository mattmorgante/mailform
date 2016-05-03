class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Saved Successfully!"
    else 
      redirect_to root_path, notice: "Failed to save"
    end 
  end

  private 

    def subscriber_params
      params.require(:lead).permit(:name, :email, :source)
    end
end