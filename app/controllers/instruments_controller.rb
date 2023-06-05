class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show update destroy ]

  # GET /instrument
  def superIndex
    render json: Instrument.all
  end
  
  def index
    page = params.fetch(:page, 1).to_i
    per_page = params.fetch(:per_page, 5).to_i

    instruments = Instrument.all.offset((page - 1) * per_page).limit(per_page)

    render json: instruments
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

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:instrument_name, :manufacturing_year, :number_of_devices, :description, :price, :model)
  end
end
