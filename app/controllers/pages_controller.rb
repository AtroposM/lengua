class PagesController < ApplicationController
  def home
    @offer = Offer.new
  end
end
