
require 'rails_helper'

describe GithubManager::SearchService do
  it 'exist' do
    service = GithubManager::SearchService.new('rails')

    expect(service).to be_a(GithubManager::SearchService)
  end

  it 'gets repositories by query', :vcr do
    api_response = GithubManager::SearchService.call('rails')
    body = JSON.parse api_response.body

    expect(body).to have_key('items')
    expect(body).to have_key('total_count')
  end
end