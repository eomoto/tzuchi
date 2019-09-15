class ArticlesController < ApplicationController
  def index
    @articles = Article.published.order(:published_at).page(params[:page]).per(params[:per])
  end

  def show
    @article = Article.find(params[:id])
  end
end
