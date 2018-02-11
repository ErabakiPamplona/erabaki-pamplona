# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      # The data store for a Blog in the Decidim::Module::Blogs component. It stores a
      # title, description and any other useful information to render a blog.
      class Post < Blogs::ApplicationRecord
        include Decidim::Resourceable
        include Decidim::HasFeature
        include Decidim::Comments::Commentable

        feature_manifest_name "blogs"

        belongs_to :author, foreign_key: "decidim_author_id", class_name: "Decidim::User"
        validates :title, presence: true

        scope :created_at_desc, -> { order(arel_table[:created_at].desc) }

        # Public: Overrides the `commentable?` Commentable concern method.
        def commentable?
          feature.settings.comments_enabled?
        end

        # Public: Overrides the `accepts_new_comments?` Commentable concern method.
        def accepts_new_comments?
          commentable? && !feature.current_settings.comments_blocked
        end

        # Public: Overrides the `comments_have_alignment?` Commentable concern method.
        def comments_have_alignment?
          true
        end

        # Public: Overrides the `comments_have_votes?` Commentable concern method.
        def comments_have_votes?
          true
        end
      end
    end
  end
end
