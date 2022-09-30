class CartSessionsController < ApplicationController
  before_action :set_cart_session, only: %i[ show edit update destroy checkout ]

  # GET /cart_sessions or /cart_sessions.json
  def index
  end

  # GET /cart_sessions/1 or /cart_sessions/1.json
  def show
    
  end

  # GET /cart_sessions/new
  def new
    @cart_session = CartSession.new
  end

  # GET /cart_sessions/1/edit
  def edit
  end

  # POST /cart_sessions or /cart_sessions.json
  def create
    @cart_session = CartSession.new(cart_session_params)
    @cart_session.user_id = session[:user_id]
    respond_to do |format|
      if @cart_session.save
        format.html { redirect_to cart_session_url(@cart_session), notice: "Cart session was successfully created." }
        format.json { render :show, status: :created, location: @cart_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_sessions/1 or /cart_sessions/1.json
  def update
    respond_to do |format|
      if @cart_session.update(cart_session_params)
        format.html { redirect_to cart_session_url(@cart_session), notice: "Cart session was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_sessions/1 or /cart_sessions/1.json
  def destroy
    @cart_session.destroy

    respond_to do |format|
      format.html { redirect_to cart_sessions_url, notice: "Cart session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def checkout
    @order = Order.new(@cart_session.attributes)

    if check_quantity_cart(@cart_session)[0] == false 
      flash[:danger] = "Don't enough size for #{check_quantity_cart(@cart_session)[1].product.name}"
      redirect_to root_path
    else
      if @order.save
        @cart_session.cart_items.each do |cart_item|
          OrderItem.create(order_item_attrs(@order, cart_item))
          cart_item.product.product_sizes.each do |product_size|
            if product_size.size.name == cart_item.size
              number = product_size.quantity 
              number -= cart_item.quantity
              product_size.update_attribute(:quantity, number)
            end
          end
          total = 0
          cart_item.product.product_sizes.each do |product_size|
            total += product_size.quantity
          end
          cart_item.product.update_attribute(:quantity_remain, total)
        end
        @cart_session.destroy
        flash[:success] = "Order was successfully, please check your mail to confirm"
        redirect_to root_path
        # @order.order_items.each do |order_item|
        #   order_item.send_shop_order_email
        # end
        # @order.user.send_customer_order_email
      else
        flash[:danger] = "Order was rejected"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_session
      @cart_session = CartSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_session_params
      params.require(:cart_session).permit(:sum_money, :user_id)
    end

    def order_item_attrs(order, cart_item)
      {
        order_id: order.id,
        product_id: cart_item.product_id,
        quantity: cart_item.quantity,
        size: cart_item.size
      }
    end
end
