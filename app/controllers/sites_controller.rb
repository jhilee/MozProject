class SitesController < ApplicationController
  def show
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.all
  end
end
