module Admin::Controllers::Links
  class Destroy
    include Admin::Action

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      LinkRepository.delete(link) if params.valid? && link
      redirect_to routes.links_path
    end

    def link
      @link ||= LinkRepository.find(params[:id])
    end
  end
end
