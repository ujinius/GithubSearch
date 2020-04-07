
module GithubManager
  class SearchService < GithubService

    attr_accessor :query

    def initialize(query)
      @query = query
      super()
    end

    # Used in parent class for final resource url generating.
    #
    def service_endpoint
      'search/repositories'
    end

    def call
      @connection.get(query: { q: "#{@query} in:name,description" })
    rescue Excon::Error => e
      logger.error e.inspect
      false
    end

  end
end
