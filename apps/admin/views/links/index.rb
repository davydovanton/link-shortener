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

    def delete_link_form(link)
      form = Form.new(:link, routes.link_path(link.id),
                      { link: link }, { method: :delete })

      form_for form, class: '' do
        submit 'Delete', class: 'btn btn-danger'
      end
    end
  end
end
