class KeywordsController < ApplicationController

  def show
    @site = Site.find(params[:id])
    @keywords = Keyword.where(site_id:params[:id])
  end
end
