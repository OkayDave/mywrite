require 'rails_helper'

describe 'Navigation', type: :feature do
  before { visit '/' }

  it "has a link to the articles" do
    expect(page).to have_link "Articles"
  end

  it "has a link to submit a new article" do
    expect(page).to have_link "Submit new article"
  end


  context 'articles' do
    before do
      @article = FactoryGirl.create :article
      visit '/'
      click_link 'Read full article'
    end

    it "navigates to the article page" do
      expect(current_path).to match(/\/articles\/\d+[a-zA-Z0-9\-]+/)
    end
  end

end
