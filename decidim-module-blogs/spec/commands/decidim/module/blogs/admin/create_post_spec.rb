# frozen_string_literal: true

require "spec_helper"

module Decidim
  module Module
    module Blogs
      module Admin
        describe CreatePost do
          subject { described_class.new(form, current_user) }

          let(:organization) { create :organization }
          let(:participatory_process) { create :participatory_process, organization: organization }
          let(:current_feature) { create :feature, participatory_space: participatory_process, manifest_name: "blogs" }
          let(:current_user) { create :user, organization: organization }
          let(:title) { "Post title" }
          let(:body) { "Lorem Ipsum dolor sit amet" }

          let(:invalid) { false }
          let(:form) do
            double(
              invalid?: invalid,
              title: { en: title },
              body: { en: body },
              current_feature: current_feature,
              decidim_author_id: current_user.id
            )
          end

          context "when the form is not valid" do
            let(:invalid) { true }

            it "is not valid" do
              expect { subject.call }.to broadcast(:invalid)
            end
          end

          context "when everything is ok" do
            let(:post) { Post.last }

            it "creates the post" do
              expect { subject.call }.to change { Post.count }.by(1)
            end

            it "sets the title" do
              subject.call
              expect(translated(post.title)).to eq title
            end

            it "sets the body" do
              subject.call
              expect(translated(post.body)).to eq body
            end

            it "sets the author" do
              subject.call
              expect(post.decidim_author_id).to eq current_user.id
            end

            it "sets the feature" do
              subject.call
              expect(post.feature).to eq current_feature
            end

            it "broadcasts ok" do
              expect { subject.call }.to broadcast(:ok)
            end
          end
        end
      end
    end
  end
end
