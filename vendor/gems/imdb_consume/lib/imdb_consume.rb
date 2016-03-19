require "imdb_consume/version"
require "imdb_consume/stream"
require "typhoeus"

module ImdbConsume
  DEFAULT_DOMAIN_URL = 'http://www.omdbapi.com/?'

  def self.remote_domain
    @remote_domain ||= (ENV['IMDB_API_URL'] || DEFAULT_DOMAIN_URL)
  end

  def self.remote_domain=(new_val)
    @remote_domain = new_val
  end
end
