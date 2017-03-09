class CreateAppreciates < ActiveRecord::Migration[5.0]
  def change
    create_table :appreciates do |t|
    	t.references :user, index: true, on_delete: :cascasde, foreign_key: true
    	t.references :tidbit, index: true, on_delete: :cascasde, foreign_key: true
      t.timestamps
    end
  end
end
