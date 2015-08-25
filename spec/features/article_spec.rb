require 'rails_helper'

describe "articles", type: :feature do
  before do
    2.times { FactoryGirl.create :article }
    @article = Article.first
  end

  describe 'user browses articles' do
    before {  visit '/' }
    
    it "is the article page" do
      expect(page).to have_text("Articles") 
    end

    it "shows article snippets" do
      expect(page).to have_text(@article.subject)
    end

    it "links to articles" do
      expect(page).to have_link("Read full article")
    end

  end

  describe 'user reads a full article' do
    before { visit article_url(@article) }

    it "shows the article title" do
      expect(page).to have_text(@article.subject)
    end

    it "has link to edit article" do
      expect(page).to have_link("Edit Article")
    end

    it "has link tyo delete article" do
      expect(page).to have_link("Delete Article")
    end

    it "has a comments section" do
      expect(page).to have_text("Comments")
    end

    it "shows the author's name" do 
      expect(page).to have_text("Written by #{@article.author}")
    end

  end

  describe 'user posts an article' do
    before { visit new_article_url }

    it "shows the title" do
      expect(page).to have_text("New Article")
    end

    it "has a submit button" do
      expect(page).to have_button("Post Article")
    end

    
    context 'posting an article' do
      before do
        @name = Faker::Name.first_name
        @title = Faker::Company.name
        @content = Faker::Lorem.word
      end
      
      it "allows posting of an article" do
        fill_in "Author", with: @name
        fill_in "Title", with: @title
        fill_in "Content", with: @content

        click_button "Post Article"

        expect(page).to have_text("Article successfully")
        expect(page).to have_text(@title)
      end

    end

  end


end
