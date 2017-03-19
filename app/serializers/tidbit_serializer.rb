class TidbitSerializer < ActiveModel::Serializer
	attributes :id,
	:title,
	:description,
	:source,
	:name,
	:location,
	:date,
	:the_tags,
	:name

	def name
		object.user ? object.user.name : ''
	end

	def date
		object.created_at.to_i
	end

	def the_tags
		object.tags.map {|t| t.name }
	end
end
