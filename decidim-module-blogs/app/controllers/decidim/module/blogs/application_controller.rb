# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      # This controller is the abstract class from which all other controllers of
      # this engine inherit.
      #
      # Note that it inherits from `Decidim::Features::Basecontroller`, which
      # override its layout and provide all kinds of useful methods.
      class ApplicationController < Decidim::Features::BaseController
        helper Decidim::Module::Blogs::ApplicationHelper
      end
    end
  end
end
