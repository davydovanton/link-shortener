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

  describe '#top_ten' do
    before do
      (1..10).each do |i|
        LinkRepository.create(Link.new(url: 'site.org/test', hash_value: '12345678', redirection_count: i))
      end
    end

    it 'returns 10 links with higest redirection_count value' do
      LinkRepository.top_ten.first.redirection_count.must_equal 10
      LinkRepository.top_ten.last.redirection_count.must_equal 1
      LinkRepository.top_ten.count.must_equal 10
    end
  end
end
