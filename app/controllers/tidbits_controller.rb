class TidbitsController < ApplicationController
	def index
		@tidbits = Tidbit.all.order(created_at: :desc)
		if params.has_key?(:tags) && params[:tags] != '' && (tags = params[:tags].split(',')).count > 0
			tag_ids = Tag.ids_for(tags)
			@tidbits = @tidbits.match_tags(tag_ids)
		end
		render json: @tidbits, status: :ok
	end

	def create
		@tidbit = Tidbit.new(tidbit_params)
		@tidbit.tag_ids = Tag.ids_for(params[:tidbit][:tags])
		@tidbit.user_id = UserService.get_user(session.key?(:user_id) ? session[:user_id] : false,params[:tidbit][:name]).id
		session[:user_id] = @tidbit.user_id
		if @tidbit.save
			render json: @tidbit, status: :ok
		else
			render json: {error: @tidbit.errors.inspect}, status: 422
		end
	end

	def tidbit_params
		params.require(:tidbit).permit(
			:title,
			:description,
			:source,
			:location,
		)
	end

end
