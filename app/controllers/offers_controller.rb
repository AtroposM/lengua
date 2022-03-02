class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = policy_scope(Offer).order(created_at: :desc)

     # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,

        info_window: render_to_string(partial: "info_window", locals: {offer: offer})
      }
    end
  end

  def show

  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save!
      redirect_to @offer, notice: "Offer was created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    if @offer.save!
      redirect_to @offer, notice: "Your offer was updated"
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url, notice: "Offer was destroyed"
  end

  private
  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def offer_params
    params.require(:offer).permit(:language, :level, :date, :duration)
  end
end
