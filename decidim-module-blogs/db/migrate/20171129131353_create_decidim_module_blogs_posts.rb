# frozen_string_literal: true

class CreateDecidimModuleBlogsPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_module_blogs_posts do |t|
      t.jsonb :title
      t.jsonb :body
      t.references :decidim_feature, index: true
      t.timestamps
    end
  end
end
