# frozen_string_literal: true

require "decidim/faker/localized"
require "decidim/core/test/factories"
require "decidim/participatory_processes/test/factories"

FactoryBot.define do
  factory :post_feature, parent: :feature do
    name { Decidim::Features::Namer.new(participatory_space.organization.available_locales, :blogs).i18n_name }
    manifest_name :blogs
    participatory_space { create(:participatory_process, :with_steps, organization: organization) }
  end

  factory :post, class: "Decidim::Module::Blogs::Post" do
    title { Decidim::Faker::Localized.sentence(3) }
    body { Decidim::Faker::Localized.wrapped("<p>", "</p>") { Decidim::Faker::Localized.sentence(4) } }
    feature { build(:feature, manifest_name: "blogs") }
  end
end
