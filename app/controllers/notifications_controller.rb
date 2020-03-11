class NotificationsController < ApplicationController

  def new_notifications_by_user
    # byebug
    user = User.find_by(id: params[:id])
    new_nots = user.new_notifications.reverse
    new_nots.each{ |n| n.viewed = true; n.save }

  
      render json: {
        notifications: new_nots
      }
    
  end

end
