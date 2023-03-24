class InstrumentdetailsController < ApplicationController
  before_action :set_instrumentdetail, only: %i[ show update destroy ]

  # GET /instrumentdetails
  def index
    @instrumentdetails = Instrumentdetail.all

    render json: @instrumentdetails
  end

  # GET /instrumentdetails/1
  def show
    render json: @instrumentdetail
  end

  # POST /instrumentdetails
  def create
    @instrumentdetail = Instrumentdetail.new(instrumentdetail_params)

    if @instrumentdetail.save
      render json: @instrumentdetail, status: :created, location: @instrumentdetail
    else
      render json: @instrumentdetail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instrumentdetails/1
  def update
    if @instrumentdetail.update(instrumentdetail_params)
      render json: @instrumentdetail
    else
      render json: @instrumentdetail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instrumentdetails/1
  def destroy
    @instrumentdetail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrumentdetail
      @instrumentdetail = Instrumentdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrumentdetail_params
      params.require(:instrumentdetail).permit(:range, :resolution, :accuracy)
    end
end
