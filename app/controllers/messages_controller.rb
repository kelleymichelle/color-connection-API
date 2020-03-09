class MessagesController < ApplicationController

  def inbox
    user = User.find_by(id: params[:id])
    byebug
  end

  def show
    recipient = User.find_by(id: params[:id])
  end

  def create
    # byebug
    recipient = User.find_by(id: params[:id])
    current_user = User.find_by(id: params[:data][:currentUser][:id])
    content = params[:data][:content]

    message = Message.new(content: content)
    message.sender = current_user
    message.reciever = recipient
    # byebug
    if message.save
      render json: {
        status: :created,
        message: message,
        conversation: Message.conversation(current_user, recipient)
      }
    else
      render json: {
        status: 500,
        errors: message.errors.full_messages
      }  
    end
  end

  # private

  # def message_params
  #   params.require(:message).permit(:content, :currentUser, :recipient)
  # end

end
