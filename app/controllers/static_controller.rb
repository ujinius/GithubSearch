
class StaticController < ApplicationController

  def root; end

  def search
    api_response = GithubManager::SearchService.call(query_params[:query])
    body = JSON.parse api_response.body
    @repositories = body['items']

    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def query_params
    params.permit(:query)
  end

end