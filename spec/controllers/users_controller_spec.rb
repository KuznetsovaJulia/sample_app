require "rails_helper"
RSpec.describe UsersController do
  describe '#home' do
    it 'should get new' do
      get :new
      expect(response.status).to eq 200
    end
  end
end
