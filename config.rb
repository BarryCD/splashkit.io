###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

# Root Layout
with_layout :root do
  page "/*"
end
# Article layout
with_layout :articles do
  page "/articles/*"
end
# API layout
with_layout :api do
  page "/api/*"
end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  # Require all functions in the helpers directory
  require_all "helpers"
end

# Use Ruby Slim and disable option warning
require 'slim'
Slim::Engine.disable_option_validator!

# Import CSS/SCSS
set :css_dir, 'stylesheets'
activate :autoprefixer

# Import JavaScript
set :js_dir, 'javascripts'

# Set the image directory to be ./images
set :images_dir, 'images'

# Activate markdown using Redcarpet parsing engine and syntax highlighting
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
activate :rouge_syntax

# Pretty index directory structure
activate :directory_indexes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash
end
