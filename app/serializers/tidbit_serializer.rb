class TidbitSerializer < ActiveModel::Serializer
	attributes :id,
	:title,
	:description,
	:source
end
