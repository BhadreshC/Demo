class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :cancel_order, :deliverd, :assign ]
  prepend_after_action :send_invoice, only: :deliverd
  prepend_before_action :set_cookie, only: :show
  # prepend_before_action :check_auth, only: :destroy
  # after_action :send_mail, only: :cancel_order
  # GET /orders
  # GET /orders.json

  def set_cookie
    puts "hello"
    # puts @order.as_json
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts cookies[:name] = current_admin.name
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts "hello"
  end
  def check_auth
    puts "--=-=---=-=-=-=-=-"
    puts "--=-=---=-=-=-=-=-"
    puts "--=-=---=-=-=-=-=-"
    puts "--=-=---=-=-=-=-=-"
  end
  def index
    @orders = Order.all
    @ordercounts =Order.group(:delivery_status).count
    respond_to do |format|
      format.html
      format.csv{ send_data @orders.custom_csv}
    end
  end

  def send_invoice
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts "send method call"
    puts "send mail"
    puts "-==-=-=-"
    puts "-==-=-=-"
    puts "-==-=-=-"
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def cancel_order
    @order.delivery_status = "cancelled"
    @order.save
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Order was successfully cancelled.' }
      format.json { render :show, status: :ok, location: @order }
    end
  end

  def deliverd
    @order.delivery_status = "Delivered"
    @order.save
    respond_to do |format|
      format.html { redirect_to orders_path, notice: "#{@order.name} was successfully Delivered." }
      format.json { render :show, status: :ok, location: @order }
    end
  end

  def assign
    @delivery_boy = DeliveryBoy.find(params[:delivery_boy_id])
    @assigned = @delivery_boy.orders << @order
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Order was successfully cancelled.' }
      format.json { render :show, status: :ok, location: @order }
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        if params[:order][:delivery_status] == "cancelled"
          @delivery_boy = Order.find(params[:id]).delivery_boy
          format.html { redirect_to @delivery_boy, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        end
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :address, :customer_name,:delivery_reason, :delivery_status)
    end
end
