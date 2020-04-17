
require 'rails_helper'

describe GithubManager::SearchService do
  it 'exist' do
    service = GithubManager::SearchService.new('rails')

    expect(service).to be_a(GithubManager::SearchService)
  end

  it 'gets repositories by query', :vcr do
    items = GithubManager::SearchService.call('rails')

    expect(items.size).to be > 0
  end

  it "doesn't get repositories by wrong query", :vcr do
    items = GithubManager::SearchService.call('notexistrailsrepoositoryforsoomereasonatall')

    expect(items.size).to be == 0
  end
end