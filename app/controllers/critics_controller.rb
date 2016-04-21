class CriticsController < ApplicationController
	load_and_authorize_resource :except => [:create, :update]
	before_action :set_restaurant
	before_action :set_critic, only: [:show, :edit, :update, :destroy]

	def index
		@critics = @restaurant.critics.all
	end

	def show
	end

	def new
		@critic = @restaurant.critics.new
	end

	def create
		@critic = @restaurant.critics.new(critics_params)
		@critic.user = current_user

		if @critic.save && current_user.critics.push(@critic)
			redirect_to restaurant_critic_path(@restaurant, @critic)
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @critic.update(critics_params)
			redirect_to restaurant_critic_path(@restaurant, @critic)
		else
			render "edit"
		end
	end

	def destroy
		@critic.destroy
		redirect_to restaurant_path(@restaurant)
	end

	protected

	def set_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def set_critic
		@critic = @restaurant.critics.find(params[:id])
	end

	def critics_params
		params.require(:critic).permit(:title, :content)
	end
end
