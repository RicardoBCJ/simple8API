class CreateHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :help_requests do |t|
      t.string :title
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.string :kind
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :helpers
      t.string :description
      t.string :condition




      t.timestamps
    end
  end
end
