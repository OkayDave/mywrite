class ArticlesController < ApplicationController
  layout 'darkly'

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to :root
    else
      render action: :edit
    end
  end


  private

  def article_params
    params.require(:article).permit(:author, :subject, :body)
  end
end
