class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user

    if message.save!
      ActionCable.server.broadcast 'messages',
        message: message.text,
        user: message.user.email
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private 
  
  def message_params
    params.require(:message).permit(:text, :chatroom_id)
  end
end
