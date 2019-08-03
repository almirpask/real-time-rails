class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(params.require(:chatroom).permit(:topic))

    if @chatroom.save
      redirect_to chatrooms_path
    else
      redirect_to chatrooms_path
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
