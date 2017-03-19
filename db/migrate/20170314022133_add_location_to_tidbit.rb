class AddLocationToTidbit < ActiveRecord::Migration[5.0]
  def change
  	add_column :tidbits, :location, :string, :default => ''
  end
end
