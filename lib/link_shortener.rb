require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/link_shortener/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/link_shortener_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/link_shortener_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/link_shortener_development'
  #    adapter type: :sql, uri: 'mysql://localhost/link_shortener_development'
  #
  adapter type: :file_system, uri: 'file:///db/links'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :links do
      entity     Link
      repository LinkRepository

      attribute :id,                Integer
      attribute :url,               String
      attribute :hash_value,        String
      attribute :redirection_count, Integer
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/link_shortener/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
