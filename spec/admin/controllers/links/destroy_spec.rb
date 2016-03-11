require 'spec_helper'
require_relative '../../../../apps/admin/controllers/links/destroy'

describe Admin::Controllers::Links::Destroy do
  let(:action) { Admin::Controllers::Links::Destroy.new }
  let(:params) { Hash[] }

  it 'is redirect to links index' do
    response = action.call(params)
    response[0].must_equal(302)
    response[1]['Location'].must_equal('/links')
  end

  describe 'DELETE link' do
    let(:link) { LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678', redirection_count: 1)) }
    let(:params) { Hash[id: link.id] }

    describe 'when link id exist' do
      it 'deletes link' do
        id = link.id
        action.call(params)

        LinkRepository.find(id).must_be_nil
      end
    end

    describe 'when link id not exist' do
      let(:params) { Hash[id: (link.id + 100)] }

      it 'redirects to index page' do
        action.call(params)
        LinkRepository.find(params[:id]).must_be_nil
      end
    end
  end
end
