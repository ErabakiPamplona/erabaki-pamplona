# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      # Custom helpers, scoped to the blogs engine.
      #
      module ApplicationHelper
        include PaginateHelper
        include Decidim::Module::Blogs::PostsHelper
        include Decidim::Comments::CommentsHelper
      end
    end
  end
end
