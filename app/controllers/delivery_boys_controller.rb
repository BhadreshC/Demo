class DeliveryBoysController < ApplicationController
  before_action :set_delivery_boy, only: [:show, :edit, :update, :destroy]

  # GET /delivery_boys
  # GET /delivery_boys.json
  def index
    @delivery_boys = DeliveryBoy.all
  end

  # GET /delivery_boys/1
  # GET /delivery_boys/1.json
  def show
    @assign_orders = @delivery_boy.orders.where(delivery_status: ['assign', 'Delivered','cancelled'])
  end

  # GET /delivery_boys/new
  def new
    @delivery_boy = DeliveryBoy.new
  end
  # GET /delivery_boys/1/edit
  def edit
  end

  # POST /delivery_boys
  # POST /delivery_boys.json
  def create
    @delivery_boy = DeliveryBoy.new(delivery_boy_params)

    respond_to do |format|
      if @delivery_boy.save
        format.html { redirect_to @delivery_boy, notice: 'Delivery boy was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_boy }
      else
        format.html { render :new }
        format.json { render json: @delivery_boy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_boys/1
  # PATCH/PUT /delivery_boys/1.json
  def update
    respond_to do |format|
      if @delivery_boy.update(delivery_boy_params)
        format.html { redirect_to @delivery_boy, notice: 'Delivery boy was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_boy }
      else
        format.html { render :edit }
        format.json { render json: @delivery_boy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_boys/1
  # DELETE /delivery_boys/1.json
  def destroy
    @delivery_boy.destroy
    respond_to do |format|
      format.html { redirect_to delivery_boys_url, notice: 'Delivery boy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def cancel_order
    @order = Order.find(params[:id])
    @order.delivery_status = "cancelled"
    @order.save
    respond_to do |format|
      format.html { redirect_to @order.delivery_boy, notice: "#{@order.name} is successfully cancelled" }
      format.json { render :show, status: :ok, location: @delivery_boy }
    end
  end
  def deliverd_order
    @order = Order.find(params[:id])
    @order.delivery_status = "Delivered"
    @order.save
    respond_to do |format|
      format.html { redirect_to @order.delivery_boy, notice: "#{@order.name} is successfully Delivered" }
      format.json { render :show, status: :ok, location: @delivery_boy }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_boy
      @delivery_boy = DeliveryBoy.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def delivery_boy_params
      params.require(:delivery_boy).permit(:name, :number, :address)
    end
end
