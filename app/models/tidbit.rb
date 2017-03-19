class Tidbit < ApplicationRecord
	has_many :tags_tidbits
	has_many :tags, through: :tags_tidbits
	accepts_nested_attributes_for :tags
	belongs_to :user

	scope :match_tags, -> (arr) {
			find_by_sql(["
				SELECT p0.*
				FROM tidbits p0
				JOIN (
				SELECT tidbit_id
				FROM tags_tidbits
				WHERE tag_id in (#{arr.join(", ")})
				GROUP BY tidbit_id
				HAVING COUNT(DISTINCT tag_id) = #{arr.length}
				) p1 ON p0.id = p1.tidbit_id
				"])
		
	}
end
