class AddFullat2ToConversations < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :fullat2, :bigint
  end
end
