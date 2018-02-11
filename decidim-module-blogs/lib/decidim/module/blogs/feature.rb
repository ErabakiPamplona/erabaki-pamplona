# frozen_string_literal: true

require "decidim/features/namer"

Decidim.register_feature(:blogs) do |feature|
  feature.engine = Decidim::Module::Blogs::Engine
  feature.admin_engine = Decidim::Module::Blogs::AdminEngine
  ## TODO Change the icon to a blog one.
  feature.icon = "decidim/module/blogs/icon.svg"

  feature.on(:before_destroy) do |instance|
    raise StandardError, "Can't remove this feature" if Decidim::Module::Blogs::Post.where(feature: instance).any?
  end

  feature.register_stat :posts_count, primary: true, priority: Decidim::StatsRegistry::MEDIUM_PRIORITY do |features, _start_at, _end_at|
    Decidim::Module::Blogs::Post.where(feature: features).count
  end

  feature.settings(:global) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
    settings.attribute :comments_enabled, type: :boolean, default: true
  end

  feature.settings(:step) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
    settings.attribute :comments_blocked, type: :boolean, default: false
  end

  feature.register_resource do |resource|
    resource.model_class_name = "Decidim::Module::Blogs::Post"
  end

  feature.seeds do |participatory_space|
    step_settings = if participatory_space.allows_steps?
                      { participatory_space.active_step.id => { comments_enabled: true, comments_blocked: false } }
                    else
                      {}
                    end

    feature = Decidim::Feature.create!(
      name: Decidim::Features::Namer.new(participatory_space.organization.available_locales, :blogs).i18n_name,
      manifest_name: :blogs,
      published_at: Time.current,
      participatory_space: participatory_space,
      settings: {
        vote_limit: 0
      },
      step_settings: step_settings
    )

    5.times do
      author = Decidim::User.where(organization: feature.organization).all.first

      post = Decidim::Module::Blogs::Post.create!(
        feature: feature,
        title: Decidim::Faker::Localized.sentence(5),
        body: Decidim::Faker::Localized.wrapped("<p>", "</p>") do
          Decidim::Faker::Localized.paragraph(20)
        end,
        author: author
      )

      Decidim::Comments::Seed.comments_for(post)
    end
  end
end
