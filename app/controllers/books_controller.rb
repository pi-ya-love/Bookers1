class BooksController < ApplicationController
    # before_action :update_params, only: [:update, :new]

    # before_action :set_book, only: [:show, :edit, :update, :destroy] # ← 追加
    protect_from_forgery :except => [:destroy]


    def index
        @books = Book.all
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id])
    end

    def create
        @books = Book.all
        @book = Book.new(book_params)
        if @book.save
            redirect_to book_path(@book), notice: 'Book was successfully created.'
        else
            render action: :index
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to @book, notice: 'Book was successfully updated'
        else
            render :edit
        end
    end


    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path, notice: 'Book was successfully destroyed.'
    end



    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
