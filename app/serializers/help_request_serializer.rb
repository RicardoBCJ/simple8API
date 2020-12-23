class HelpRequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :user_id, :kind, :address, :latitude, :longitude, :helpers, :description, :condition, :created_at, :updated_at
end
