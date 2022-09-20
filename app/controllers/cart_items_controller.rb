class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.cart_session_id = current_cart_session.id
    @cart_item.product_id = current_product.id
    if count_cart_sessions == 2
      first_cart_session.destroy
    end
    
    total = @cart_item.cart_session.sum_money
    total += @cart_item.product.price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)
    if @cart_item.save
      flash[:success] = "Cart item was successfully created"
    else
      render "new"
    end
  end

  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    puts "Hi"
    puts "cart_item.product.price: #{@cart_item.product.price}"
    puts "cart_item.quantity: #{@cart_item.quantity}"
    puts "Hi"
    old_quantity = @cart_item.quantity
    total = @cart_item.cart_session.sum_money
    @cart_item.update_attribute(:quantity, params[:quantity_cart_item])

    total -= old_quantity*@cart_item.product.price
    total += @cart_item.product.price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)
    redirect_to cart_session_path(current_cart_session)
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    total = @cart_item.cart_session.sum_money
    total -= @cart_item.product.price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)
    @cart_item.destroy
    flash[:success] = "Cart item was successfully delete."
    redirect_to cart_session_path(current_cart_session)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :size, :product_id, :cart_session_id)
    end
end
