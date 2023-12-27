class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @article = Article.new
    @articles = Article.all
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.date = Date.today
    @article.rating = (1..5).to_a.sample
    if @article.save
      redirect_to article_path(@article)
    else
      render partial: "articles/form", locals: { article: @article }, status: :unprocessable_entity
    end
  end

  def update
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
