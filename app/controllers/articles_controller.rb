class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @article = Article.new
    @articles = Article.all.order(date: :desc)
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @message = Message.new
    @messages = Message.where(article: @article).order(:id)
    @review = Review.new
    article_rates = Review.where(article: @article).pluck(:rating)
    @average_rating = article_rates.empty? ? "Article not rated yet" : (article_rates.sum / article_rates.length).round(1)
    @has_user_rated = Review.where(user: current_user, article: @article).length >= 1
    @user_rating = Review.find_by(user: current_user, article: @article).rating unless Review.find_by(user: current_user, article: @article).nil?
    @message_rating = Vote.pluck(:rating).sum
    @vote = Vote.new
    # @has_user_voted = Vote.find_by(user: current_user, message: Message.find(params[:message_id])).empty?
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.date = Date.today
    if @article.save
      redirect_to article_path(@article), notice: "Article successfully created."
    else
      flash[:alert] = "Your article could not be processed. Please review the form carefully."
      render partial: "articles/add_form", locals: { article: @article }, status: :unprocessable_entity
      # Find a way to display the modal instead of displaying the index page
    end
  end

  def update
    # if params[:article][:rates].present?
    #   @article.rates << params[:article][:rates].to_i
    #   @article.save
    #   redirect_to article_path(@article)
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render partial: "articles/edit_form", locals: { article: @article }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
