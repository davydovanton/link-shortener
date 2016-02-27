post '/create', to: 'shortener#create', as: :create_shortener
get  '/',       to: 'shortener#index',  as: :root

get '/:hash',     to: 'shortener#redirect'
# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
