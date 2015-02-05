class ReviewsController < ApplicationController

	def index
		@product 	= Product.find params[:product_id]
		@reviews 	= @product.reviews
	end

	def show
		@product 	= Product.find params[:product_id]
		@review 	= @product.reviews.find params[:id]
	end	

	def new
		@product 	= Product.find params[:product_id]
		@review 	= @product.reviews.new
	end

	def create
		@product 	= Product.find params[:product_id]
		@review 	= @product.reviews.new review_params

		if @review.save
			redirect_to action: 'show', controller: 'products', product_id: @product.id, notice: "New review created"
		else 
			flash[:alert] = "Failed!"
			render 'new'
		end
	end

	def edit
		@product 	= product.find params[:product_id]
		@review 	= @product.reviews.find params[:id]
	end

	def update
		@product 	= product.find params[:product_id]
		@review 	= @product.reviews.find params[:id]

		if @review.update_attributes review_params
			redirect_to action: 'index', controller: 'reviews', product_id: @product.id
		else 
			flash[:alert] = "Failed!"
			render 'edit'
		end
	end

	def destroy
		@product 	= product.find params[:product_id]
		@review 	= @product.reviews.find params[:id]

		if @review.destroy 
			redirect_to action: 'index', controller: 'reviews', product_id: @product.id
		else 
			flash[:alert] = "Failed!"
  		end
	end


	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

end
