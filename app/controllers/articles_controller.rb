class ArticlesController < ApplicationController
     
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  # @articles = Article.accessible_by(current_ability)
  load_and_authorize_resource

    def index
      @articles = Article.all
    end
   
    def show
      @article = Article.find(params[:id])
    end
   
    def new
      @article = Article.new
    end
   
    def edit
      @article = Article.find(params[:id])
    end
   
    def create
      @article = Article.new(article_params)
      # abort current_user.id.inspect
      @article.user_id = current_user.id
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end
   
    def update
      @article = Article.find(params[:id])
   
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
   
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
   
      redirect_to articles_path
    end
   
    private
      def article_params
        params.require(:article).permit(:title, :text, )
      end
end
