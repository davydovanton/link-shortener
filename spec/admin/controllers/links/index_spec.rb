require 'spec_helper'
require_relative '../../../../apps/admin/controllers/links/index'

describe Admin::Controllers::Links::Index do
  let(:action) { Admin::Controllers::Links::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
