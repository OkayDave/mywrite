class ArticlesController < ApplicationController
  layout 'darkly'

  def index
    @articles = Article.all
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_url(@article), success: "Article successfully created!"
    else
      render action: :edit, danger: "Unable to create article"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(article_params)
      redirect_to article_url(@article), success: "Article sucessfully edited!"
    else
      render action: :edit, danger: "Unable to create article!"
    end
  end


  private

  def article_params
    params.require(:article).permit(:author, :subject, :body)
  end
end
