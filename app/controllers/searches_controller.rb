class SearchesController < ApplicationController
  def index
    @search = Search.new
  end

  def search
    @search = Search.new(params[:search])

    if @search.valid?
      @streams = ImdbService.search(@search.title)
      flash[:notice] = "Found #{@streams['Search'].count} streams on IMDB."
    end
  end
end