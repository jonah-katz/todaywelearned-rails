class TagsTidbit < ApplicationRecord
	belongs_to :tidbit
	belongs_to :tag
end
