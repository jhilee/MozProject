class ImportersController < ApplicationController
  def new
    @importer = Importer.new
  end

  def create
    @importer = Importer.new(importer_params)
    @importer.save
    @importer.import(params[:importer][:csv])

    respond_to do |format|
      if @importer.save
        format.js
      else
        format.html { render :new}
      end
    end

  end

  private
  def importer_params
    params.require(:importer).permit(:csv)
  end
end