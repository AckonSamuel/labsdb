class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show update destroy]

  def super_index
    page = params.fetch(:page, 1).to_i
    per_page = params.fetch(:per_page, 5).to_i

    instruments = Instrument.all.offset((page - 1) * per_page).limit(per_page)

    render json: instruments
  end

  def index
    instruments = Instrument.all
    render json: instruments
  end

  def show
    render json: @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params.except(:categories, :labs))
    assign_categories_and_labs

    if @instrument.save
      render json: @instrument, status: :created, location: @instrument
    else
      render json: { errors: @instrument.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    update_instrument_photos if params.dig(:instrument, :instrument_photos).present?
    update_instrument_attributes if any_instrument_attribute_present?
    update_categories_and_labs

    if @instrument.errors.empty?
      render json: @instrument, status: :ok
    else
      render json: { errors: @instrument.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument.destroy
  end

  private

  def assign_categories_and_labs
    @instrument.categories = Category.where(id: params.dig(:instrument, :categories))
    @instrument.labs = Lab.where(id: params.dig(:instrument, :labs))
  end

  def update_categories_and_labs
    @instrument.categories = Category.where(id: params.dig(:instrument, :categories)) if params.dig(:instrument, :categories).present?
    @instrument.labs = Lab.where(id: params.dig(:instrument, :labs)) if params.dig(:instrument, :labs).present?
  end

  def update_instrument_photos
    params.dig(:instrument, :instrument_photos).each do |_key, photo|
      @instrument.instrument_photos.purge
      @instrument.instrument_photos.attach(photo)
    end
  end

  def any_instrument_attribute_present?
    instrument_params.except(:instrument_photos, :categories, :labs).values.any?(&:present?)
  end

  def update_instrument_attributes
    @instrument.update(instrument_params.except(:instrument_photos, :categories, :labs))
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
      instrument_photos: []
    ).tap do |whitelisted|
      whitelisted[:categories] = params[:instrument][:categories] if params[:instrument][:categories].present?
      whitelisted[:labs] = params[:instrument][:labs] if params[:instrument][:labs].present?
      whitelisted[:instrument_photos] = params[:instrument][:instrument_photos] if params[:instrument][:instrument_photos].present?
    end
  end
  
end
