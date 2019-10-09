class Api::V1::sArticlesController < BaseApiController
  before_action :set_article, only: [:show]

  def index
    articles = Article.all
    render json: articles
  end

  def show
    render json: @article
  end

  private

      def set_article
        @article = Article.find(params[:id])
      end

end
