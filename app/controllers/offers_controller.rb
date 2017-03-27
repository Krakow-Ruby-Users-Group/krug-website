class OffersController < ApplicationController
  def index
    @sponsors = Sponsor.includes(:offers).sorted
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
