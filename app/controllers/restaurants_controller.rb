class RestaurantsController < ApplicationController
	load_and_authorize_resource :except => [:create, :update , :voting]
	before_action :set_restaurant, only: [:show, :update, :edit, :destroy ,:voting]

	def index
		@restaurants = Restaurant.all
	end

	def show
		@numberofvotes = 0
		@restaurant.votes.each do |v|
		@numberofvotes+=v.value.to_i
		end	
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurant_path(@restaurant)
		else
			render "new"
		end
	end

	def edit
		
	end

	def update
		
		if @restaurant.update(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render "edit"
		end
	end

	def destroy
		@restaurant.destroy
		redirect_to restaurants_path
	end

	def voting
		Vote.vote(params[:vote], current_user, @restaurant)
		redirect_to restaurant_path(@restaurant)
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :adresa, :id)
	end

	def set_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

end
