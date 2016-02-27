post '/create', to: 'shortener#create', as: :create_shortener
get  '/',       to: 'shortener#index'
# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
