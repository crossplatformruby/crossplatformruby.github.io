require "extensions/views"

activate :views
activate :directory_indexes
# Time.zone = "UTC"

page "/rss.xml", layout: false

set :relative_links, true
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layout, 'layouts/application'

set :protocol, "http://"
set :host, "crossplatformruby.com"
set :port, 80

configure :development do
 activate :livereload
end

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch   = 'master'
end

helpers do
end

configure :development do
  # Used for generating absolute URLs
  set :host, "crossplatformruby-test.ngrok.com" #Middleman::PreviewServer.host
  set :port, "80" #Middleman::PreviewServer.port
end
