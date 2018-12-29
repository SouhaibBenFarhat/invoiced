module V1
  class ProductsController < ApplicationController
    def index
      @products = Product.all
      puts @products
      render json: {message: "success", count: @products.count, data: {products: @products}}, status: :ok
    end

    def show
      @product = Product.find_by(id: params[:id])
      render json: {message: "success",  data: {products: @product}}, status: :ok
    end

    def create
      @product = Product.new(product_params)
      @product.save
      render json: @product, status: :created
    end

    private

    def product_params
      params.require(:product).permit(:name, :description)
    end
  end
end
