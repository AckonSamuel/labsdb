class InstrumentController < ApplicationController
  before_action :set_instrument, only: %i[ show update destroy ]

  # GET /instrument
  def index
    @instrument = Instrument.all

    render json: @instrument
  end

  # GET /instrument/1
  def show
    render json: @instrument
  end

  # POST /instrument
  def create
    @instrument = Instrument.new(instrument_params)

    if @instrument.save
      render json: @instrument, status: :created, location: @instrument
    else
      render json: @instrument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instrument/1
  def update
    if @instrument.update(instrument_params)
      render json: @instrument
    else
      render json: @instrument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instrument/1
  def destroy
    @instrument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrument_params
      params.require(:instrument).permit(:instrument_name, :manufacturing_year, :number_of_devices, :description, :price, :model)
    end
end
