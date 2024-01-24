class MessagesController < ApplicationController
  before_action :set_article, only: %i[create destroy]
  before_action :set_message, only: %i[destroy]

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.article = @article
    @message.date = Date.today
    if @message.save
      redirect_to article_path(@article)
    else
      render partial: "messages/add_form", locals: { article: @article, message: @message }, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
