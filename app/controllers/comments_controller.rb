class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article

    if @comment.save 
      redirect_to :back, success: "Comment successfully posted"
    else
      render template: "articles/show", danger: "Unable to post comment"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
