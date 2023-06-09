class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show update ]

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

    @instrument = Instrument.create(instrument_params.except(:categories, :labs))
  
    params[:instrument][:labs].each do |lab|
      @instrument.labs << Lab.find_by(id: lab)
    end
  
    params[:instrument][:categories].each do |category|
      @instrument.categories << Category.find_by(id: category)
    end
  
    if @instrument.save
      render json: @instrument, status: :created, location: @instrument
    else
      render json: { errors: @instrument.errors.full_messages }, status: :unprocessable_entity
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
    ids = params.fetch(:blacklist, [])
    ids.each do |item|
      Instrument.find_by(id: item).destroy
    end
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(
      :instrument_name, 
      :manufacturing_year,
      :model,
      :price,
      :description,
      :resolution,
      :range,
      :accuracy,
      categories: [],
      labs: [],
    )
  end

  def delete_params
    params.require(:instrument).permit(:blacklist, [])
  end
end
