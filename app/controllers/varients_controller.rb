class VarientsController < ApplicationController
  before_action :set_varient, only: [:show, :edit, :update, :destroy]

  # GET /varients
  # GET /varients.json
  def index
    @varients = Varient.all
  end

  # GET /varients/1
  # GET /varients/1.json
  def show
  end

  # GET /varients/new
  def new
    @varient = Varient.new
  end

  # GET /varients/1/edit
  def edit
  end

  # POST /varients
  # POST /varients.json
  def create
    @varient = Varient.new(varient_params)

    respond_to do |format|
      if @varient.save
        format.html { redirect_to @varient, notice: 'Varient was successfully created.' }
        format.json { render :show, status: :created, location: @varient }
      else
        format.html { render :new }
        format.json { render json: @varient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /varients/1
  # PATCH/PUT /varients/1.json
  def update
    respond_to do |format|
      if @varient.update(varient_params)
        format.html { redirect_to @varient, notice: 'Varient was successfully updated.' }
        format.json { render :show, status: :ok, location: @varient }
      else
        format.html { render :edit }
        format.json { render json: @varient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varients/1
  # DELETE /varients/1.json
  def destroy
    @varient.destroy
    respond_to do |format|
      format.html { redirect_to varients_url, notice: 'Varient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_varient
      @varient = Varient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def varient_params
      params.require(:varient).permit(:size, :color, :material)
    end
end
