class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = @book.id
		if @book_comment.save
			redirect_to book_path(@book)
		else
			flash[:error] = "Comment can't be blank"
			redirect_to book_path(@book)
	  #   @user = User.find(@book.user_id)
	  #   @book_comments = BookComment.all
	  #   @book_comment = BookComment.new
	  #   @new = Book.new
			# render 'books/show'
		end
	end
	def destroy
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.find_by(book_id: @book.id)
		@comment.destroy
		redirect_to book_path(@book)
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
