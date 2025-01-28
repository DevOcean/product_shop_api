module Api
  module V1
    class CartsController < ApplicationController
      before_action :set_cart

      def show
        render json: @cart.as_json(
          only: [:id],
          include: {
            cart_items: {
              only: [:id, :product_id, :configuration],
              include: {
                product: {
                  only: [:id, :name, :price]
                }
              }
            }
          }
        )
      end

      def add_item
        product = Product.find(params[:product_id])
        configuration = params[:configuration]

        cart_item = @cart.cart_items.new(product: product, configuration: configuration)

        if cart_item.save
          render json: cart_item, status: :created
        else
          render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_cart
        # For simplicity, we'll use a single cart.
        # In a real application, associate carts with users or sessions.
        @cart = Cart.first_or_create
      end
    end
  end
end
