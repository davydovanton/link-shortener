require 'spec_helper'
require_relative '../../../../apps/web/controllers/shortener/redirect'

describe Web::Controllers::Shortener::Redirect do
  let(:link)   { LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678')) }
  let(:action) { Web::Controllers::Shortener::Redirect.new }
  let(:params) { Hash[hash: link.hash_value ] }

  describe 'when link exist in db' do
    it 'redirects to full url' do
      response = action.call(params)
      response[0].must_equal 302
    end
  end

  describe 'when link exist in db' do
    let(:params) { Hash[hash: '' ] }

    it 'returns error status' do
      response = action.call(params)
      response[0].must_equal 404
    end
  end
end
