class TidbitsController < ApplicationController
	def index
		@tidbits = Tidbit.all.order(created_at: :desc)
		render json: @tidbits, status: :ok
	end

	def create
		@tidbit = Tidbit.new(tidbit_params)
		if @tidbit.save
		render json: @tidbit, status: :ok
		else
			render json: {error: @tidbit.errors.inspect}, status: 422
		end
	end

	def tidbit_params
		params.require(:tidbit).permit(:title,:description,:source)
	end
end
