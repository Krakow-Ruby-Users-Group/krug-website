# Controller responsible for rendering all static pages
class PagesController < ApplicationController
  def index
    @sponsors = Sponsor.all
  end
end
