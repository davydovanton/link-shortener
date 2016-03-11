require 'spec_helper'
require_relative '../../../../apps/admin/views/dashboard/index'

describe Admin::Views::Dashboard::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/dashboard/index.html.slim') }
  let(:view)      { Admin::Views::Dashboard::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end

  describe '#title' do
    it 'returns title string' do
      view.title.must_equal 'Main Page'
    end
  end

  describe '#top_links' do
    before do
      LinkRepository.clear

      (1..3).each do |i|
        LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678', redirection_count: i))
      end
    end

    after do
      LinkRepository.clear
    end

    it 'returns block with top links' do
      view.top_links.to_s.must_equal "<div>\n" +
        "<ul>\n" +
          "<li>site.org&#x2F;test : 3</li>\n" +
          "<li>site.org&#x2F;test : 2</li>\n" +
          "<li>site.org&#x2F;test : 1</li>\n" +
        "</ul>\n" +
      "</div>"
    end
  end
end
