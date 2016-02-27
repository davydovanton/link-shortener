require 'spec_helper'

describe Link do
  let(:link) { Link.new }
  let(:hash_string) { SecureRandom.hex(5) }

  it 'have url attribute' do
    link.url = 'site.com/test'
    link.url.must_equal 'site.com/test'
  end

  it 'have hash_value attribute' do
    link.hash_value = hash_string
    link.hash_value.must_equal hash_string
  end

  describe '#generate_hash' do
    it 'sets hash value to hash attribute' do
      SecureRandom.stub :hex, '7406a044' do
        link.generate_hash
        link.hash_value.must_equal '7406a044'
      end
    end

    it 'generates new hash value with 8 chars' do
      link.generate_hash
      link.hash_value.length.must_equal 8
    end
  end
end
