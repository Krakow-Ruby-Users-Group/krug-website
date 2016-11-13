# Controller responsible for rendering all static pages
class PagesController < ApplicationController
  # Setup and trigger landing page
  def index
    @sponsors = Sponsor.sorted
  end
end
