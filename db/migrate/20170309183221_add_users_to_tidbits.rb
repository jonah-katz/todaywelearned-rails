class AddUsersToTidbits < ActiveRecord::Migration[5.0]
  def change
  	add_reference :tidbits, :user, index: true, on_delete: :cascase, foreign_key: true
  end
end
