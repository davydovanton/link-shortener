module Web::Controllers::Shortener
  class Redirect
    include Web::Action

    def call(params)
      link = LinkRepository.find_by_hash(params[:hash])

      if link
        link.increment_redirection_count
        LinkRepository.update(link)

        redirect_to link.url
      else
        status 404, 'Not exist'
      end
    end
  end
end
