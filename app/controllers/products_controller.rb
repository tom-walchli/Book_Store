class ProductsController < ApplicationController

	def index
		@list_length = 20
		@products 	= Product.get_all(@list_length)
	end

	def show
		@product 	= Product.find params[:id]
	end	

	def new
		@product 	= Product.new
	end

	def create
		@product 	= Product.new product_params

		if @product.save
			redirect_to action: 'index', controller: 'products', notice: "New book added"
		else 
			render 'new', alert: "Failed!"
		end
	end

	def edit
		@product 	= product.find params[:id]
	end

	def update
		@product 	= product.find params[:id]

		if @product.update_attributes product_params
			redirect_to action: 'index', controller: 'product'
		else 
			flash[:alert] = "Failed!"
			render 'edit'
		end
	end

	def destroy
		@product 	= product.find params[:id]

		if @product.destroy 
			redirect_to action: 'index', controller: 'products'
		else 
			flash[:alert] = "Failed!"
  		end
	end

	def search
		@query = params[:query]
		@products = Product.search(@query)
		render 'search'
	end


	private

	def product_params
		params.require(:review).permit(:name, :description, :price)
	end

end
