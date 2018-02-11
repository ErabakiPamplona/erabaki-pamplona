# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "decidim/module/blogs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.version = Decidim::Module::Blogs.version
  s.authors = ["Isaac Massot Gil"]
  s.email = ["isaac.mg@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-module-blogs"
  s.summary = "A Blog component for decidim's participatory processes."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::Module::Blogs.version
  s.add_dependency "httparty", "~> 0.15.0"
  s.add_dependency "jquery-tmpl-rails", "~> 1.1.0"
  s.add_dependency "kaminari", "~> 1.0.1"

  s.add_development_dependency "decidim-admin", Decidim::Module::Blogs.version
  s.add_development_dependency "decidim-assemblies", Decidim::Module::Blogs.version
  s.add_development_dependency "decidim-dev", Decidim::Module::Blogs.version
  s.add_development_dependency "decidim-participatory_processes", Decidim::Module::Blogs.version
end
