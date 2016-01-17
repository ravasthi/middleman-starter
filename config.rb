# Paths
set :css_dir,     'styles'
set :js_dir,      'scripts'
set :images_dir,  'images'
set :fonts_dir,   'fonts'

# Haml
set :haml, :format => :html5

###
# Blog settings
###

Time.zone = 'America/Los_Angeles'

activate :blog do |blog|
  blog.prefix              = 'blog'
  blog.permalink           = '{year}/{month}/{title}.html'
  blog.sources             = '{year}-{month}-{day}-{title}.html'
  blog.layout              = 'article'
  blog.summary_separator   = /READMORE/

  blog.tag_template        = 'tag.html'
  blog.calendar_template   = 'calendar.html'

  blog.paginate            = true
  blog.per_page            = 10
  blog.page_link           = 'page/{num}'
end

page '/feed.xml', layout: false

activate :directory_indexes

# Markdown
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Livereload
activate :livereload

# Syntax highlighting
activate :syntax, line_numbers: true

###
# Sprockets
###
sprockets.append_path File.join root, 'bower_components'

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'
require 'sassy-buttons'

# Change Compass configuration
compass_config do |config|
  config.relative_assets         = true
  config.additional_import_paths = [
    'styles/basics',
    'styles/shared',
    'styles/vendor/icon-fonts'
  ]
end

###
# Page options, layouts, aliases and proxies
###

###
# Helpers
###

# Development-specific configuration
configure :development do
  # Change Compass configuration
  compass_config do |config|
    config.output_style  = :expanded
    config.line_comments = true
  end
end

# Build-specific configuration
configure :build do
  # Change Compass configuration
  compass_config do |config|
    config.output_style  = :compact
    config.line_comments = false
  end

  ignore '.DS_Store'
  ignore 'images/originals/*'
  ignore 'images/**/*.psd'
  ignore '**/LICENSE*'
  ignore '**/NOTICE*'
  ignore '**/README*'
  ignore '**/HISTORY*'

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets
end

###
# Deployment
###

activate :deploy do |deploy|
  deploy.method       = :rsync
  deploy.host         = 'your.domain.com'
  deploy.path         = '/home/user/directory'
  deploy.build_before = true
end
