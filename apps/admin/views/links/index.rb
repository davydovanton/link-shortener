module Admin::Views::Links
  class Index
    include Admin::View

    def title
      'Links'
    end

    def external_link_to(link)
      fail URI::InvalidURIError if URI.parse(link).to_s.empty?

      link = "http://#{link}" unless link[/\Ahttps?:\/\//]
      html.a(href: link) { link }
    rescue URI::InvalidURIError
      html.span(link.empty? ? 'empty' : link)
    end
  end
end
