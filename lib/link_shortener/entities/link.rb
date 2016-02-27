class Link
  include Hanami::Entity
  attributes :url, :hash_value

  def generate_hash
    self.hash_value = SecureRandom.hex(4)
  end
end
