class VouchersController < ApplicationController
    def index
        @vouchers = Voucher.all
    end

    def new
        @voucher = Voucher.new
    end

    def show 
        @voucher = Voucher.find(params[:id])
    end

    def create
        @voucher = Voucher.new(voucher_params)
        @voucher.shop_id = current_shop.id
        if @voucher.save
            flash[:success] = "Voucher was successfully created"
            redirect_to current_shop
        else
            render 'new'
        end
    end

    def edit
        @voucher = Voucher.find(params[:id])
    end

    def update
    end

    def destroy
        @voucher = Voucher.find(params[:id])
        @voucher.destroy
        flash[:success] = "Voucher was successfully destroyed"
        redirect_to vouchers_path
    end

    private
    def voucher_params
        params.require(:voucher).permit(:code, :quantity, :percent, :shop_id)
    end
end
