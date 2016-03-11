require 'spec_helper'
require_relative '../../../../apps/admin/controllers/links/index'

describe Admin::Controllers::Links::Index do
  let(:action) { Admin::Controllers::Links::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  describe 'expose' do
    describe '#tip_links' do
      before do
        LinkRepository.clear

        (1..10).each do |i|
          LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678', redirection_count: i))
        end
      end

      after do
        LinkRepository.clear
      end

      it 'returns top links' do
        action.call(params)
        action.links.count.must_equal(10)
      end
    end
  end
end
