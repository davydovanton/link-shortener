require 'spec_helper'

describe LinkRepository do
  let(:link){ LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678')) }

  after do
    LinkRepository.clear
  end

  describe '#find_by_hash' do
    it 'returns first entitie finded by hash_value' do
      LinkRepository.find_by_hash(link.hash_value).url.must_equal link.url
    end

    describe 'when hash_value not exist' do
      it 'returns nil' do
        LinkRepository.find_by_hash('000').must_equal nil
      end
    end
  end
end
