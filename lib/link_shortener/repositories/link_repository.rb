class LinkRepository
  include Hanami::Repository

  def self.find_by_hash(hash)
    query do
      where(hash_value: hash)
    end.first
  end

  def self.top_ten
    query.desc(:redirection_count).limit(10).to_a
  end
end
