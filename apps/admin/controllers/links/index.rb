module Admin::Controllers::Links
  class Index
    include Admin::Action
    expose :links

    def call(params)
      @links = LinkRepository.all
    end
  end
end
