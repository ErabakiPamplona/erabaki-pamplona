# frozen_string_literal: true

require "kaminari"
require "jquery-tmpl-rails"

require "decidim/core"

module Decidim
  module Module
    module Blogs
      # This is the engine that runs on the public interface of `decidim-module-blogs`.
      # It mostly handles rendering the created blogs associated to a participatory
      # process.
      class Engine < ::Rails::Engine
        isolate_namespace Decidim::Module::Blogs

        routes do
          resources :posts, only: [:index, :show]
          root to: "posts#index"
        end
      end
    end
  end
end
