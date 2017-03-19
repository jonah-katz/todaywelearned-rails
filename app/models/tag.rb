class Tag < ApplicationRecord
	has_many :tags_tidbits

	def self.ids_for(tag_names_a)
		tag_names_a.map {|t| Tag.where('lower(name) = ?', t.downcase).first_or_create(:name=>t).id }
	end
end
