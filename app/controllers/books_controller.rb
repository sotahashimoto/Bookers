class BooksController < ApplicationController
  def index
    # 記事を全件取得
    @books = Book.all
    # indexページに新規投稿を表示する為
    @book = Book.new
  end

  def show
    # URLが/books/1の場合、params[:id] と記述すると、id==1を取り出せます。
    # id==1のデータをfindメソッドを利用してデータベースから取得し、@bookへ格納します。
    # レコード1件を取得するので、変数名は単数形の「@book」にします。
  	@book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:success] = 'Book was successfully created.'
  end

  def edit
    @book = Book.find(params[:id])
    flash[:success] = 'Book was successfully created.'
  end

  def update
    @book = Book.find(params[:id])
    # データをデータベースに更新保存するためのメソッド実行
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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