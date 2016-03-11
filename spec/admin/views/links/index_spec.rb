require 'spec_helper'
require_relative '../../../../apps/admin/views/links/index'

describe Admin::Views::Links::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/links/index.html.slim') }
  let(:view)      { Admin::Views::Links::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end

  describe '#external_link_to' do
    describe 'when link have full url' do
      it 'returns <a> html tag with link url' do
        link = 'http://localhost:2300/admin/links'
        view.external_link_to(link).to_s.must_equal "" +
        "<a href=\"http://localhost:2300/admin/links\">\n" +
          "http:&#x2F;&#x2F;localhost:2300&#x2F;admin&#x2F;links\n" +
        "</a>"
      end
    end

    describe 'when link have not full url' do
      it 'returns <a> html tag with link url' do
        link = 'localhost/admin/links'
        view.external_link_to(link).to_s.must_equal "" +
        "<a href=\"http://localhost/admin/links\">\n" +
          "http:&#x2F;&#x2F;localhost&#x2F;admin&#x2F;links\n" +
        "</a>"
      end
    end

    describe 'when link url is not url' do
      it 'returns <span> with url text' do
        link = 'not url'
        view.external_link_to(link).to_s.must_equal "<span>not url</span>"
      end
    end

    describe 'when link url empty' do
      it 'returns <span> with empty text' do
        link = ''
        view.external_link_to(link).to_s.must_equal "<span>empty</span>"
      end
    end
  end
end
