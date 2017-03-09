class CreateTagsTidbits < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_tidbits do |t|
    	t.references :tag, index: true, on_delete: :cascasde, foreign_key: true
    	t.references :tidbit, index: true, on_delete: :cascasde, foreign_key: true
      t.timestamps
    end
  end
end
