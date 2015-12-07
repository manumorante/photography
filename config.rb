###
# Data
###

data.photos.each do |photo|
  proxy "/photo/#{photo.url}.html", '/photo/photo.html',
        :locals => {
            :url => photo.url,
            :sentence => photo.sentence,
            :src => photo.src
        }
end

###
# Directories
###

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :relative_links, true
set :partials_dir, '_partials'



###
# Compass
###

compass_config do |config|
  # DEBUG MODE
  config.sass_options = { :debug => true, :debug_info => true, :line_comments => true }

  # BUILD MODE
  # config.output_style = :compressed
  # config.output_style = :compact
  # config.sass_options = { :debug => false, :debug_info => false, :line_comments => false }
end

# Build-specific configuration
configure :build do
  # BUILD MODE
  # activate :minify_css
  # activate :minify_javascript

  activate :relative_assets

  # activate :asset_hash
  ignore '/photo/photo.html.erb'
end




###
# Helpers
###

require 'source/helpers/application_helper'
helpers ApplicationHelper