class ConversationsController < ApplicationController
    before_action :set_conversation, only: [:update]

    def index
      conversations = Conversation.all
      render json: conversations
    end

    def show
      render json: Conversation.find(params[:id])
    end
  
    def create
      conversation = Conversation.new(conversation_params)
      if conversation.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          ConversationSerializer.new(conversation)
        ).serializable_hash
        ActionCable.server.broadcast 'conversations_channel', serialized_data
        head :ok
      end
    end

    def update
      if @conversation.update(conversation_params)
        render json: @help_request
      else
        render json: @help_request_params, status: :unprocessable_entity
      end
    end
    
    private

    def set_conversation
      @conversation = Conversation.find(params[:id])
    end
    
    def conversation_params
      params.require(:conversation).permit(:title, :id, :participants, :help_request_id, :fullat2, :complete)
    end
  end