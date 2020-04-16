
module GithubManager
  class SearchService < GithubService

    attr_accessor :query

    # Getting 'query' and preparing connection to the API (hidden in parent class).
    #
    def initialize(query)
      self.query = query
      super()
    end

    # Used in parent class for final resource url generating.
    #
    def service_endpoint
      'search/repositories'
    end

    # Getting a list of repositories which are met query criteria
    #
    def call
      connection.get(query: { q: "#{query} in:name,description" })
    rescue Excon::Error => e
      logger.error e.inspect
      false
    end

  end
end
