class ImdbService

  attr_accessor :search_params

  def initialize(search)
    @search_params = search
  end

  def self.search(title)
    ImdbConsume::Stream.search(title, {plot: 'short'})
  end

  def self.find(id)
    ImdbConsume::Stream.find(id, {plot: 'short'})
  end
end