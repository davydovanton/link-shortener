require 'spec_helper'

describe Link do
  let(:link) { Link.new }
  let(:hash_string) { SecureRandom.hex(5) }

  it 'have url attribute' do
    link.url = 'site.com/test'
    link.url.must_equal 'site.com/test'
  end

  it 'have hash attribute' do
    link.url = hash_string
    link.url.must_equal hash_string
  end
end
