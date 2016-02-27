require 'spec_helper'
require_relative '../../../../apps/web/controllers/shortener/create'

describe Web::Controllers::Shortener::Create do
  let(:action) { Web::Controllers::Shortener::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
