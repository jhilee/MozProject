class ImportersController < ApplicationController
  def new
    @importer = Importer.new
  end

  def create
    @importer = Importer.new(importer_params)

    if @importer.save
      redirect_to @importer
    else
      render 'new'
    end
  end

  def show
    @importer = Importer.find(params[:id])
  end

  def import

  end

  private
  def importer_params
    params.require(:importer).permit(:csv)
  end

end