
module GithubManager
  class GithubService < ApplicationService

    attr_accessor :connection

    def initialize
      @connection = Excon.new(
        service_url,
        headers: {
          :Accept => 'application/vnd.github.mercy-preview+json',
          'User-Agent' => 'Github-Search-Global-App'
        },
        debug_request: true,
        debug_response: true,
        omit_default_port: true
      )
    end

    # Used in subclasses for call its resources.
    # Required `service_endpoint` subclass method for building url.
    #
    def service_url
      "https://api.github.com/#{service_endpoint}"
    end

  end
end
