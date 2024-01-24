class ReviewsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @review.article = @article
    @review.user = current_user
    if @review.save(review_params)
      redirect_to article_path(@article)
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:article).permit(:rating)
  end
end
