class AddCompleteToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :complete, :boolean
  end
end
