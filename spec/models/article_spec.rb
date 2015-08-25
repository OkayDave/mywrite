require 'rails_helper'

RSpec.describe Article, type: :model do
  let! (:article) { FactoryGirl.create :article }

  describe '#to_param' do
    it "contains an id" do
      expect(article.to_param).to include(article.id.to_s)
    end

    it "contains the subject" do
      expect(article.to_param).to include(article.subject.parameterize)
    end

    it "does not contain forbidden characters" do
      expect(article.to_param).to_not include(" ")
      expect(article.to_param).to_not include("#")
      expect(article.to_param).to_not include(".")
      expect(article.to_param).to_not include("/")

    end
  end


  describe '#notify' do
    before { FactoryGirl.create :subscriber }

    it "returns a DelayedJob object" do
      expect(article.notify).to be_a(Delayed::Backend::ActiveRecord::Job)
    end

  end
end
