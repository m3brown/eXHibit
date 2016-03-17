class SearchController < ApplicationController
  def index
    @streams = params[:q].present? ? ImdbConsume::Stream.search(params[:q], {plot: 'short'}) : nil
  end
end