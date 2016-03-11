module Admin::Views::Dashboard
  class Index
    include Admin::View

    def title
      'Main Page'
    end

    def top_links
      html.div do
        ul do
          LinkRepository.top_ten.each do |link|
            li("#{link.url} : #{link.redirection_count}")
          end
        end
      end
    end
  end
end
