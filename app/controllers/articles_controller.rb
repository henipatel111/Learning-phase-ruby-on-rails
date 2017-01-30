class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "hemaxi", password: "hemaxi", except: [:index, :show]
 
  def index
    @articles = Article.all
  end
  def upload
    @article = Article.new
  end

  def execute_upload
    tempfile = params[:img].tempfile
    puts "received value is :#{params[:firstname]}"
    puts "img: #{params[:img].to_s}"
    puts "path: #{tempfile.path}"
    @count = 0
    Spreadsheet.open(tempfile.path) do |book|
      book.worksheet('Sheet1').each do |row|
        break if row[0].nil?
        puts row.join(',')
        Article.new(:title => row[0],:text  => row[1]).save
        @count += 1
      end
    end
    render 'successful'
  end

  def successful
    puts "welcome"
  end

  def delete_multiple
    puts "deleting multiple articles together"
    #params[:articles].each do |id|
    #  Article.find(id.to_s).destroy
    #end

    Article.where(id: params[:articles]).destroy_all

    render 'successful'
  end

  def deletearticles
    @articles = Article.all
    puts "deleting"
    params[:index].each do |id|
      Article.find(id.to_s).destroy
      render 'successful'
    end
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
 
 private def method_read
    params.require(:article).permit(:title, :text)
 end
 

  private 
  def article_params
      params.require(:article).permit(:title, :text)
    end
end