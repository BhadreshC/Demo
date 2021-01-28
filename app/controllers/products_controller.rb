class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :remove_description]
  before_action :hello, only: [:remove_description]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def hello
    puts "-==================-=-=-=-=--=-=-----=--=-="
    puts "-==================-=-=-=-=--=-=-----=--=-="
    puts "-==================-=-=-=-=--=-=-----=--=-="
    puts "-==================-=-=-=-=--=-=-----=--=-="
  end
  def remove_description
    @product.descrpition= nil
    @product.save
    redirect_to products_path
  end

  def batch_operation
    if params[:product_ids]
      @selectproduct = Product.where(id: params[:product_ids])
      @desc= ""
      @selectproduct.each do |p|
        @desc += p.descrpition
      puts "-==================-=-=-=-=--=-=-----=--=-="
      puts "-==================-=-=-=-=--=-=-----=--=-="
      puts "-==================-=-=-=-=--=-=-----=--=-="
      end
    @p= Product.create(descrpition: @desc)
    puts @p.as_json
    end
    if params[:product][:descrpition] != nil
      @desc =params[:product][:descrpition]
      puts "-====00-=--00-0-0"
      puts "-====00-=--00-0-0"
      @desc.as_json
      puts "-====00-=--00-0-0"
      puts "-====00-=--00-0-0"
      puts "-====00-=--00-0-0"
    end
    redirect_to products_path
  end
  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:creator, :descrpition, :picture)
      # params.require(:product).permit(:title, :creator)
    end
end
