class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :help_request_id, :title, :participants, :complete, :fullat2
  has_many :messages
end
