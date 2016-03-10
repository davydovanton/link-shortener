require 'spec_helper'
require_relative '../../../../apps/admin/controllers/links/destroy'

describe Admin::Controllers::Links::Destroy do
  let(:action) { Admin::Controllers::Links::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
