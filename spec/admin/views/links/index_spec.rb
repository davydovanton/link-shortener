require 'spec_helper'
require_relative '../../../../apps/admin/views/links/index'

describe Admin::Views::Links::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/links/index.html.erb') }
  let(:view)      { Admin::Views::Links::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
