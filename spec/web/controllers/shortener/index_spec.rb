require 'spec_helper'
require_relative '../../../../apps/web/controllers/shortener/index'

describe Web::Controllers::Shortener::Index do
  let(:action) { Web::Controllers::Shortener::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
