require 'spec_helper'
require_relative '../../../../apps/web/controllers/shortener/create'

describe Web::Controllers::Shortener::Create do
  let(:action) { Web::Controllers::Shortener::Create.new }
  let(:params) { Hash[url: url] }
  let(:url)    { '' }

  it 'returns json' do
    action.call(params)
    action.format.must_equal :json
  end

  describe 'with valid params' do
    let(:url) { 'site.com/test' }

    it 'returns json hash with sucess status' do
      response = action.call(params)
      response.first.must_equal 200
      response.last[:status].must_equal :ok
    end

    it 'returns json hash with shortener link' do
      SecureRandom.stub :hex, '7406a044' do
        response = action.call(params)
        response.first.must_equal 200
        response.last[:link].must_equal '7406a044'
      end
    end

    it 'creates a new link object' do
      links_count = LinkRepository.all.count
      action.call(params)
      links_count = LinkRepository.all.count - links_count
      links_count.must_equal 1
    end
  end

  describe 'with invalid params' do
    let(:url) { nil }

    it 'returns json hash with status' do
      response = action.call(params)
      response.first.must_equal 200
      response.last[:status].must_equal :error
    end

    it 'returns json hash with shortener link' do
      response = action.call(params)
      response.first.must_equal 200
      response.last[:link].must_equal nil
    end

    it 'not create a new post' do
      links_count = LinkRepository.all.count
      action.call(params)
      links_count = links_count - LinkRepository.all.count
      links_count.must_equal 0
    end
  end
end
