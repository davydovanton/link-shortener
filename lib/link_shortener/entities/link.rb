class Link
  include Hanami::Entity
  attributes :url, :hash_value, :redirection_count

  def initialize(args = {})
    super
    @redirection_count = 0
  end

  def generate_hash
    self.hash_value = SecureRandom.hex(4)
  end

  def increment_redirection_count
    @redirection_count += 1
  end
end
