class CreateTidbits < ActiveRecord::Migration[5.0]
	def change
		create_table :tidbits do |t|
			t.string :title
			t.text :description
			t.string :source

			t.timestamps
		end
	end
end
