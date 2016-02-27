module Web::Controllers::Shortener
  class Create
    include Web::Action

    params do
      param :url, presence: true
    end

    def call(params)
      self.format = :json
      status 200, responce_hash(params)
    end

  private

    def responce_hash(params)
      if params.valid?
        link = Link.new(url: params[:url])
        link.generate_hash
        LinkRepository.create(link)
        { status: :ok, link: link.hash_value }
      else
        { status: :error }
      end
    end
  end
end
