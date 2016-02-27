module Web::Views::Shortener
  class Index
    include Web::View

    def form
      form_for link_form, id: 'js-shortener-form' do
        text_field :url

        submit 'Short link'
      end
    end

    def link_form
      Form.new(:link, routes.create_shortener_path,
        {}, { method: :post })
    end
  end
end
