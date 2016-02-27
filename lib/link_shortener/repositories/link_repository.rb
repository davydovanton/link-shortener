class LinkRepository
  include Hanami::Repository

  def self.find_by_hash(hash)
    query do
      where(hash_value: hash)
    end.first
  end
end
