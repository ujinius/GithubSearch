
class StaticController < ApplicationController

  # Main webapp endpoint. It shows the search form.
  #
  def root; end

  # Getting a list of repositories results by given 'query' param.
  # (POST method)
  #
  def search
    @repositories = GithubManager::SearchService.call(query_params[:query])

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