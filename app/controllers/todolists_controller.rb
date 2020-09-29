class TodolistsController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to todolist_path(@book.id)
    else
      render'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully updated.'
      redirect_to todolist_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to todolists_path
  end

  private
  def book_params
    # require(:book)を消したら投稿できた。理由不明。謎
    params.require(:book).permit(:title, :body)
  end

end
