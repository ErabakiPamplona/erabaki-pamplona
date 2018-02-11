# This migration comes from decidim_module_blogs (originally 20171211084630)
# frozen_string_literal: true

class AddAuthorToDecidimModuleBlogsPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_module_blogs_posts, :decidim_author_id, :integer, index: true
  end
end
