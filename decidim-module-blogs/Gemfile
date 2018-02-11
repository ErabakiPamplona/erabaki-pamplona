# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.5.0"

# Declare your gem's dependencies in decidim-initiatives.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "decidim", :git => 'git@github.com:decidim/decidim.git'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.
group :test, :development do
  gem "byebug"
  gem "faker"
end

group :development do
  gem "letter_opener_web"
end
