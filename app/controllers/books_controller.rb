class BooksController < ApplicationController
  def index
    @books = Book.all
    # 記事を全件取得
    @book = Book.new
    # indexページに新規投稿を表示する為
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])

    flash[:success] = 'Book was successfully created.'
    # 編集後の詳細画面に'内の文字'を表示
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
