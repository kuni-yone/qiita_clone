class Api::V1::ArticlesController < Api::V1::BaseApiController
  before_action :set_article, only: [:update, :destroy]

  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = current_user.articles.create!(article_params)
    render json: article
  end

  def update
    @article.update!(article_params)
    render json: @article
  end

  def destroy
    @article.destroy
    render status: 204, json: { status: 204, message: 'Not Found' }
  end

  private

    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
