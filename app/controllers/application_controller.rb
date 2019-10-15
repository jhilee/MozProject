class ApplicationController < ActionController::Base

  def import
    Application.import(params[:file])
  end
end
