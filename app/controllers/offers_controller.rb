class OffersController < ApplicationController
  def index
    @offers = Offer.includes(:sponsor).sorted
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
