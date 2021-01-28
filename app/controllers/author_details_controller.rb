class AuthorDetailsController < ApplicationController
  before_action :set_author_detail, only: [:show, :edit, :update, :destroy]

  def index
    @author_details = AuthorDetail.all
  end

  def show
  end

  # GET /author_details/new
  def new
    @author_detail = AuthorDetail.new
  end

  # GET /author_details/1/edit
  def edit
  end

  # POST /author_details
  # POST /author_details.json
  def create
    @author_detail = AuthorDetail.new(author_detail_params)

    respond_to do |format|
      if @author_detail.save
        format.html { redirect_to @author_detail, notice: 'Author detail was successfully created.' }
        format.json { render :show, status: :created, location: @author_detail }
      else
        format.html { render :new }
        format.json { render json: @author_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_details/1
  # PATCH/PUT /author_details/1.json
  def update
    respond_to do |format|
      if @author_detail.update(author_detail_params)
        format.html { redirect_to @author_detail, notice: 'Author detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @author_detail }
      else
        format.html { render :edit }
        format.json { render json: @author_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_details/1
  # DELETE /author_details/1.json
  def destroy
    @author_detail.destroy
    respond_to do |format|
      format.html { redirect_to author_details_url, notice: 'Author detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_detail
      @author_detail = AuthorDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_detail_params
      params.require(:author_detail).permit(:age, :city, :mobileno)
    end
end
