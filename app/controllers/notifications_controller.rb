class NotificationsController < ApplicationController

  def index
    user = User.find_by(id: params[:id])
    new_nots = user.new_notifications.reverse
    new_nots.each{ |n| n.viewed = true; n.save }

    if !new_nots.empty?
      render json: {
        notifications: new_nots
      }
  end

end
