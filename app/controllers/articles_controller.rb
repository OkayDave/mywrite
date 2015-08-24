class ArticlesController < ApplicationController
  layout 'darkly'

  def index
    @articles = Article.all
  end
end
