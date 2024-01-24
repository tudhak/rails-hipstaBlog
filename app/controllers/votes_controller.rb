class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @message = Message.find(params[:message_id])
    @vote = Vote.new
    @vote.rating = params[:vote][:rating].to_i
    @vote.message = @message
    @vote.user = current_user
    if @vote.save
      redirect_to article_path(@article)
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

end
