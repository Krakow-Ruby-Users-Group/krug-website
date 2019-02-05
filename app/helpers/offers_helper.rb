#  frozen_string_literal: true

module OffersHelper
  def offer_logo_url(offer)
    if offer.sponsor
      offer.sponsor.logo.thumb.url
    else
      LogoUploader.new.default_url
    end
  end
end
