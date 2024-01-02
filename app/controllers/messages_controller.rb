class MessagesController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.article = @article
    @message.rating = 0
    @message.date = Date.today
    if @message.save
      redirect_to article_path(@article)
    else
      render partial: "messages/add_message", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
