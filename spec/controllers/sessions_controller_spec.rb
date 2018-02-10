require "rails_helper"
RSpec.describe SessionsController do
    describe '#login' do
        it 'should get new' do
            get :new
            expect(response.status).to eq 200
        end
    end
end
