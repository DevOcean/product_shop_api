module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.all
        render json: @products.as_json(only: [:id, :name, :price])
      end

      def show
        @product = Product.find(params[:id])
        render json: @product.as_json(
          only: [:id, :name, :description, :price],
          include: {
            parts: {
              only: [:id, :name],
              include: {
                options: {
                  only: [:id, :name, :in_stock]
                }
              }
            }
          }
        )
      end
    end
  end
end
