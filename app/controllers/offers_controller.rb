class OffersController < ApplicationController
  def index
    @offers = Offer.order('created_at DESC').page(params[:page])
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
