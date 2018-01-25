require "rails_helper"
RSpec.describe StaticPagesController do
  describe '#home' do

    it 'should be ok when visit home' do
      get  :home
      expect(response.status).to eq 200
    end
  end

  describe '#help' do

    it 'should be ok when visit help' do
      get  :help
      expect(response.status).to eq 200
    end
  end
  describe '#help' do
    it 'should be ok when visit help' do
      get  :contact
      expect(response.status).to eq 200
    end
  end
  describe '#about' do

    it 'should be ok when visit about' do
      get  :about
      expect(response.status).to eq 200
    end
  end
end
