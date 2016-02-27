require 'spec_helper'
require_relative '../../../../apps/web/views/shortener/index'

describe Web::Views::Shortener::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/shortener/index.html.erb') }
  let(:view)      { Web::Views::Shortener::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
