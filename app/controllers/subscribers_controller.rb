class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.subscribe(subscriber_params[:email])

    if @subscriber.persisted?
      redirect_to :back, success: "You've sucessfully signed up to notifications"
    else
      redirect_to :back, danger: "Unable to subscribe to notifications"
    end
  end

  def destroy
    token = params[:token]

    @subscriber = Subscriber.find_by_token(token)
    @subscriber.destroy!

    if @subscriber.destroyed?
      redirect_to :root, success: "You're no longer subscribed :(!"
    else
      redirect_to :root, danger: "Unable to unsubscribe!"
    end
  end


  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
