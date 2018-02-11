# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      module Admin
        # This command is executed when the user creates a Post from the admin
        # panel.
        class CreatePost < Rectify::Command
          def initialize(form, current_user)
            @form = form
            @current_user = current_user
          end

          # Creates the post if valid.
          #
          # Broadcasts :ok if successful, :invalid otherwise.
          def call
            return broadcast(:invalid) if @form.invalid?

            transaction do
              create_post!
            end

            broadcast(:ok, @post)
          end

          private

          def create_post!
            @post = Post.create!(
              title: @form.title,
              body: @form.body,
              feature: @form.current_feature,
              decidim_author_id: @current_user.id
            )
          end
        end
      end
    end
  end
end
