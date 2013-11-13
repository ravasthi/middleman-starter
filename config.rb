# Haml
set :haml, :format => :html5

###
# Blog settings
###

Time.zone = "America/Los_Angeles"

activate :blog do |blog|
  blog.prefix              = "blog"
  blog.permalink           = ":year/:month/:title.html"
  blog.sources             = ":year-:month-:day-:title.html"
  # blog.taglink           = "tags/:tag.html"
  blog.layout              = "article"
  blog.summary_separator   = /READMORE/
  # blog.summary_length    = 250
  # blog.year_link         = ":year.html"
  # blog.month_link        = ":year/:month.html"
  # blog.day_link          = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template        = "tag.html"
  blog.calendar_template   = "calendar.html"

  blog.paginate            = true
  blog.per_page            = 10
  blog.page_link           = "page/:num"
end

page "/feed.xml", :layout => false

activate :directory_indexes

# Markdown
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Livereload
activate :livereload

# Syntax highlighting
activate :syntax, :line_numbers => true

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
    "styles/basics",
    "styles/shared",
    "styles/shared/sass-icon-fonts"
  ]
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir,     'styles'
set :js_dir,      'scripts'
set :images_dir,  'images'
set :fonts_dir,   'fonts'

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

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

###
# Deployment
###

activate :deploy do |deploy|
  deploy.method       = :rsync
  deploy.host         = "your.domain.com"
  deploy.path         = "/home/user/directory"
  deploy.build_before = true
  # Optional Settings
  # deploy.user  = "tvaughan" # no default
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
end
