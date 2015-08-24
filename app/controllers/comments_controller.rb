class CommentsController < ApplicationController
  def article
    @article ||= Article.find(params[:article_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article = article

    if @comment.save 
      redirect_to :back, success: "Comment successfully posted"
    else
      render template: "articles/show", danger: "Unable to post comment"
    end

  end


  def destroy
    @comment = article.comments.find(params[:id]) 
    @comment.destroy!

    if @comment.destroyed?
      redirect_to :back, success: "Comment was successfully deleted"
    else
      redirect_to :back, danger: "Unabled to delete comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
