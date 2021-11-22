class MessagesController < ApplicationController

  def create
    # find my chatroom
    # create a new message w/ params
    # associate it to the chatroom
    # associate it to the user
    # save message
    # if saved, we want to display on client page / broadcast it
    # if saved, we want to display on our page
    # errors, re render our page
    # params[:chatroom_id] => because our routes are nested

    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # if saved, we want to display on client page / broadcast it
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
