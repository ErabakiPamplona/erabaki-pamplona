# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      module Admin
        # Base controller for the administration of this module. It inherits from
        # Decidim's admin base controller in order to inherit the layout and other
        # convenience methods relevant to a this component.
        class ApplicationController < Decidim::Admin::Features::BaseController
          helper_method :posts, :post

          def posts
            @posts ||= Post.where(feature: current_feature).page(params[:page]).per(15)
          end

          def post
            @post ||= posts.find(params[:id])
          end
        end
      end
    end
  end
end
