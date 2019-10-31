class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def show
    @site = Site.find(params[:id])
    @keywords = Keyword.where(site_id:params[:id])
  end

  def show1
    @keyword = Keyword.find(params[:id])
    @google_data = Ranking.graph_rankings(@keyword.id,"google")
    @google_base_data = Ranking.graph_rankings(@keyword.id,"google_base")
    @bing_data = Ranking.graph_rankings(@keyword.id,"bing")
    @yahoo_data = Ranking.graph_rankings(@keyword.id,"yahoo")
    @gsv = Ranking.find_gsv(@keyword.id)

  end



end
