class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def create

  end
end
