class MessagesController < ApplicationController
    def create
        @messages = current_user.messages.create(bady: msg_params[:bady],room_id:params[:room_id])
    end

    private 
        def msg_params
            params.require(:message).permit(:bady)
            
        end
end
