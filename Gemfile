source "https://rubygems.org"

ruby '2.4.1'

gem "decidim", git:"https://github.com/decidim/decidim.git", :tag => 'v0.9.2'
gem "decidim-module-blogs", path:"decidim-module-blogs"
gem 'puma'
gem 'uglifier'
gem 'faker'

group :development, :test do
  gem 'byebug', platform: :mri

  gem "decidim-dev", :git => "git://github.com/decidim/decidim.git", :tag => 'v0.9.2'

end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require:false
  gem 'capistrano-rvm', require:false
  gem 'capistrano-rails', require:false
  gem 'capistrano-bundler', require:false
  gem 'capistrano3-puma', require:false
  gem 'capistrano-rails-console', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
