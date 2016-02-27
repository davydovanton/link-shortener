require 'spec_helper'
require_relative '../../../../apps/web/views/shortener/index'

describe Web::Views::Shortener::Index do
  let(:exposures) { Hash[params: {}] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/shortener/index.html.erb') }
  let(:view)      { Web::Views::Shortener::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  describe '#form' do
    it 'returns form template for card' do
      view.form.must_be_instance_of Hanami::Helpers::FormHelper::FormBuilder
    end

    it 'returns right params for form template' do
      attributes = view.form.instance_variable_get('@attributes')
      # expect(attributes[:action]).to eq '/create/1'
      attributes[:method].must_equal :post
    end
  end
end
