class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @article = Article.new
    @articles = Article.all.order(date: :desc)
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @message = Message.new
    @messages = Message.all.order(:id)
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.date = Date.today
    @article.rating = (1..5).to_a.sample
    if @article.save
      redirect_to article_path(@article), notice: "Article successfully created."
    else
      flash[:alert] = "Your article could not be processed. Please review the form carefully."
      render partial: "articles/add_form", locals: { article: @article }, status: :unprocessable_entity
      # Find a way to display the modal instead of displaying the index page
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render partial: "articles/edit_form", locals: { article: @article }, statusl: :unprocessable_entity
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
