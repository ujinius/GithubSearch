
require 'rails_helper'

describe 'Navigate' do
  describe 'Welcome page' do
    it 'can be loaded successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end