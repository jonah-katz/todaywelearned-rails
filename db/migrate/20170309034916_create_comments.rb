class CreateComments < ActiveRecord::Migration[5.0]
	def change
		create_table :comments do |t|
			t.text :text
			t.references :user, index: true, on_delete: :cascasde, foreign_key: true
			t.references :tidbit, index: true, on_delete: :cascasde, foreign_key: true

			t.timestamps
		end
	end
end
