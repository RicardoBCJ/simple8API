class HelperSerializer < ActiveModel::Serializer
  attributes :id, :participants, :full_at
  has_one :help_request
end
