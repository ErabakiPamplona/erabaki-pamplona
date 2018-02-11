# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      # This is the admin interface for `decidim-module-blogs`. It lets you edit and
      # configure the blog associated to a participatory process.
      class AdminEngine < ::Rails::Engine
        isolate_namespace Decidim::Module::Blogs::Admin

        paths["db/migrate"] = nil

        routes do
          resources :posts
          root to: "posts#index"
        end

        def load_seed
          nil
        end
      end
    end
  end
end
