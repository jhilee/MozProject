class RankingsController < ApplicationController
  def show
    @keyword = Keyword.find(params[:id])
    @rankings = Ranking.where(keyword_id:params[:id])
    @google_ranks = Ranking.extract_data(@rankings,"google")
    @google_base_ranks = Ranking.extract_data(@rankings,"google_base")
    @bing_ranks = Ranking.extract_data(@rankings,"bing")
    @yahoo_ranks = Ranking.extract_data(@rankings,"yahoo")
    @gsv = Ranking.extract_data(@rankings,"gsv")
    @google_wranks = Ranking.get_weighted_rank(@keyword.id,@google_ranks,@gsv)
    @google_base_wranks = Ranking.get_weighted_rank(@keyword.id,@google_base_ranks,@gsv)
    @bing_wranks = Ranking.get_weighted_rank(@keyword.id,@bing_ranks,@gsv)
    @yahoo_wranks = Ranking.get_weighted_rank(@keyword.id,@yahoo_ranks,@gsv)

  end

  def export_csv
    respond_to do |format|
      selected_rankings = Ranking.where(keyword_id: params["keyword_id"], date_ranked: [params["from"]..params["to"]])
      format.html
      format.csv {
        send_data selected_rankings.to_csv(), type: 'text/csv', filename: "Ranking Data-#{params["keyword"]}-#{Date.today}.csv"
      }
    end
  end
end
