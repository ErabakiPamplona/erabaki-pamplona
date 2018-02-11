# frozen_string_literal: true

module Decidim
  module Module
    module Blogs
      # Abstract class from which all models in this engine inherit.
      class ApplicationRecord < ActiveRecord::Base
        self.abstract_class = true
      end
    end
  end
end
